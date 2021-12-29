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


-- Le nombre de calorie d’une recette est similaire à celui
-- de la somme des calories de ses ingrédients (+/- 20%).

