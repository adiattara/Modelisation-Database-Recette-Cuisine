--  Contraintes dynamiques
--      Pas plus de 20 ingrédients par recette.
create or replace trigger no_more_than20ingr
before insert on "Ingredients_Recettes"
for each row
declare
v_nbingr number;
begin

    -- à chaque ajout d'une nouvelle recette on compte
    -- le nombre d'ingrédients qui lui est associé
    select count("idIngredient") into v_nbingr
    from    "Ingredients_Recettes"
    where   "idRecette" = :new."idRecette" ;
    
    -- si ce nombre dépasse 20 on soulève une exception
    if v_nbingr > 20 then
        raise_application_error(-40400, 'Pas plus de 20 ingrédients par 
        recette !');
    end if;
end;
/

--      La liste des ingrédients à acheter ne peut pas être 
--      générée plus d’un mois à l’avance.
create or replace trigger check_date_bying_ingr_list
before insert or update on "Ingredients_A_Acheter_Utilisateurs"
for each row
begin
    -- si la date plannifiée est inférieur à moins d'un mois 
    if :new."date" < add_months(sysdate, -1) then 
        raise_application_error(-40400, 'La liste des ingrédients à acheter ne 
        peut pas être générée plus d''un mois à l''avance !');
    end if ;
end;
/

--      La durée d’une recette est égale au moins au minimum
--      de la durée de ses étapes.
create or replace trigger check_recipe_cooking_time
before insert or update on "Recettes"
for each row 
declare 
v_dureeTotaleEtapes "Recettes"."dureeTotale"%type;
v_dureeTotaleRecette "Recettes"."dureeTotale"%type;  -- duree total
begin
    -- selection de la duree total d'une recette
    select  "dureeTotale" into v_dureeTotaleRecette
    from    "Recettes"
    where   "idRecette" = :new."idRecette" ;
    
    -- totaliter la duree des étapes de réalisation de la recette
    select  sum("dureeEtape") into v_dureeTotaleEtapes
    from    "Etapes"
    where   "idRecette" = :new."idRecette" ;
    
    if v_dureeTotaleRecette < v_dureeTotaleEtapes then
        raise_application_error(-40400, 'La durée d’une recette est égale au 
        moins au minimum de la durée de ses étapes !');
    end if ;
    
    exception
        when no_data_found then 
            null ;
end;
/


--      Le nombre de calorie d’une recette est similaire à celui
--      de la somme des calories de ses ingrédients (+/- 20%).
create or replace trigger check_calories_similarity
after insert or update on "Ingredients_Recettes"
for each row
declare
v_nb_calorie_recette "Ingredients"."calories" % type ;
v_nb_total_calorie_etapes "Ingredients"."calories" % type ;
begin
    
    -- on calcul le nombre de calorie généré par chaque ingrédient 
    -- associé à une recette en fonction de la quantité 
    -- de l'ingrédient utilisée dans la recette. Puis on cumul 
    -- l'ensemble des calories dans la recette
    
    select  sum(ig."calories" * ir."quantite") into v_nb_total_calorie_etapes
    from    "Ingredients_Recettes" ir, "Ingredients" ig 
    where   "idRecette" = :new."idRecette" 
        and 
            ir."idIngredient" = ig."idIngredient" ;
    
    
    -- on récupère le nombre de calorie généré par les recettes
    -- ce nombre est sencé être plus moins proche du nombre précédent
    select  "calories" into v_nb_calorie_recette
    from    "Recettes"
    where   "idRecette" = :new."idRecette" ;
    
    -- vérification ...
    if ((v_nb_calorie_recette < (0.8 * v_nb_total_calorie_etapes) or -- (-20%)
        v_nb_calorie_recette > (1.2 * v_nb_total_calorie_etapes))  -- (+20%)
        and 
        (v_nb_total_calorie_etapes < (0.8 * v_nb_calorie_recette) or 
        v_nb_total_calorie_etapes > (1.2 * v_nb_calorie_recette))) 
    then
        raise_application_error(-40400, 'Le nombre de calories d''une recette 
        est similaire à celui de la somme des calories de ses ingrédients 
        (+/- 20%)');
    end if ;
end ;
/


 --         Les plannings de recettes et la liste des courses sont archivés 
 --         lorsqu’ils sont supprimés ou une fois les dates associées dépassées.
 -- ** Nous supposons un scheduler excécutera le code suivant périodiquement
 
 -- ** Ce déclencheur provoque l'archivage d'une ligne planning lors d'une suppression
 
create or replace trigger archive_plan_when_delete
before delete on "Planning_Recettes_Utilisateurs"
for each row
declare 
v_planning_line "Planning_Recettes_Utilisateurs" % rowtype;
begin
    select * into v_planning_line
    from   "Planning_Recettes_Utilisateurs" pu
    where pu."idRecette" = :old."idRecette" ;
    
    insert into "Planning_Recettes_Archive"
    (
        "idRecette",
        "idUt",
        "at"
    ) 
    values
    (
        v_planning_line."idRecette",
        v_planning_line."idUt",
        v_planning_line."at"
    ) ;
    
end ;
/

 -- ** Ce déclencheur provoque l'archivage d'une liste achât lors d'une suppression
create or replace trigger archive_bying_list_when_delete
before delete on "Ingredients_A_Acheter_Utilisateurs"
for each row
declare 
v_buying_line "Ingredients_A_Acheter_Utilisateurs" % rowtype;
begin
    select * into v_buying_line
    from   "Ingredients_A_Acheter_Utilisateurs" pa
    where pa."idIngredient" = :old."idIngredient" ;
    
    insert into "Ingredients_A_Acheter_Utilisateurs_Archive"
    (
        "idUt",
        "idIngredient",
        "quantite",
        "date"
    ) 
    values
    (
        v_buying_line."idUt",
        v_buying_line."idIngredient",
        v_buying_line."quantite",
        v_buying_line."date"
    ) ;
    
end ;
/
 
 
 
