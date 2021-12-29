SET SERVEROUTPUT ON

-- une fonction qui retourne la liste des ingrédients où la 
-- quantité d’ingrédient a été adaptée pour un nombre de 
-- personnes différent du nombre de personnes de la recette d’origine
create or replace function adapter_quantite(
    p_id_recette IN "Recettes"."idRecette"%TYPE,
    p_nb_persones IN "Recettes"."nombreDePersonnes"%TYPE
)
return clob
is
    -- déclaration d'un curseur pour le parcours
    cursor cur_ing
    is
        select ir."idIngredient", ir."quantite", i."nomIngredient", u."symbole"
        from "Ingredients_Recettes" ir, "Ingredients" i, "Unites" u
        where ir."idIngredient" = i."idIngredient"
        and
              i."idUnite" = u."idUnite"
        and
              ir."idRecette" = p_id_recette;

    -- déclaration d'une variable qui va contenir le result de notre requête
    v_res clob := 'INGREDIENTS :' || CHR(10);

    -- v.a pour le nb de personne prevu initialement
    v_nb_pers_init  "Recettes"."nombreDePersonnes"%TYPE;
begin
     -- récupération du nombre de personne pour lequel la recette à été prévu initialement

    select "nombreDePersonnes" into v_nb_pers_init
    from "Recettes"
    where "idRecette" = p_id_recette ;

     -- pour chaque ingrédient on adapte le nombre de personne

    for c_ing in cur_ing loop
        v_res := v_res || '  * ' || c_ing."nomIngredient" || ' (quantité : ' ||
                 (c_ing."quantite" / v_nb_pers_init) * p_nb_persones || ' ' ||
                 c_ing."symbole" || ')' || CHR(10);
    end loop;
    return v_res ;
end;
/

-- pour tester :
BEGIN
  dbms_output.put_line(adapter_quantite(1, 4));
END;
