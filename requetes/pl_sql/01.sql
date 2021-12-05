
create or replace function changer_nom_ingredient(
    id_ing_from "Ingredients"."idIngredient"%type,
    id_ing_to "Ingredients"."idIngredient"%type,
    id_recette "Recettes"."idRecette"%type
) 
return "Etapes"."descriptionEtape"%type
is 
    -- déclaration d'un curseur pour le parcours des etapes
    cursor cur_etapes 
    is
    select 
        lower("nomEtape") as "nomEtape",
        lower("descriptionEtape") as "description" ,
        concat("dureeEtape",  'min') as "dureeEtape"
    from "Etapes"
    where "idRecette" = id_recette
    order by "ordre";

    -- variables de réception
    v_id_ing_from "Ingredients"."nomIngredient"%type;
    v_id_ing_to "Ingredients"."nomIngredient"%type;
    v_info "Etapes"."descriptionEtape"%type := '';
begin
    -- récupération de l'ingrédient à modifier
    select lower("nomIngredient")
        into v_id_ing_from
    from "Ingredients"
    where "idIngredient" = id_ing_from;

    -- récupération de l'ingrédient pour modifier
    select lower("nomIngredient")
        into v_id_ing_to
    from "Ingredients"
    where "idIngredient" = id_ing_to;

    -- parcours simple du curseur
    for cur_e in cur_etapes loop
        v_info := v_info || upper(replace(cur_e."nomEtape", v_id_ing_from, v_id_ing_to));
        v_info := v_info || '(' || cur_e."dureeEtape" || ')' || chr(10);

        -- s'il y a une description cpmplémentaire pour l'étape
        if cur_e."description" is not null then
            v_info := v_info || '' || replace(cur_e."description", id_ing_from, id_ing_to) || chr(10) ;
        end if;
        v_info := v_info || chr(10) ;
    end loop ;
    return v_info ;

end;
/

-- pour tester :
BEGIN
  dbms_output.put_line(changer_nom_ingredient(1, 1, 2));
END;
/