SET SERVEROUTPUT ON

-- ne procédure qui crée une copie de recette où certains ingrédients
-- ont été remplacés par d’autres équivalents et où le nombre de 
-- personnes peut-être différent de celui de la recette originale.
create or replace procedure copier_recette
(
    p_id_recette_a_dupliquer "Recettes"."idRecette"%type ,  -- recette à copier
    p_nouveau_nb_personne "Recettes"."nombreDePersonnes"%type,  -- nb personne
    p_id_ingr_a_echanger "Ingredients"."idIngredient"%type  -- l'ingrédient à remplacer
)
as
    v_id_ingr_equivalent "Ingredients"."idIngredient"%type ;
    v_same_categ "Ingredients_Categories"."idCategorie"%type ;
    v_prochain_id_recette "Recettes"."idRecette"%type ;
    v_prochain_id_etape "Etapes"."idEtape"%type ;
    v_recette_init "Recettes"%rowtype ;
    v_nom_ingr_a_echanger "Ingredients"."nomIngredient"%type ;
    v_nom_ingr_equivalent "Ingredients"."nomIngredient"%type ;

    -- curseur pour récupérer tous les ingrédients associer à la recette à copier
    cursor cur_ingr is select * from "Ingredients_Recettes" where "idRecette" = p_id_recette_a_dupliquer ;
    -- curseur pour récupérer l'ensemble des étapes de réalisation de la recette à copier
    cursor cur_etapes is select * from "Etapes" where "idRecette" = p_id_recette_a_dupliquer ;
begin

    -- on récupère le nom de l'ingrédient à switcher
    -- celui dont il faut trouver l'équivalent
    select lower("nomIngredient") into v_nom_ingr_a_echanger
    from "Ingredients"
    where "idIngredient" = p_id_ingr_a_echanger;

    -- on récupère l'id catégorie de l'ingrédient à modifier
    -- il servira pour le remplacer par un autre ingrédient de même catégorie
    select "idCategorie" into v_same_categ
    from "Ingredients_Categories"
    where "idIngredient" = p_id_ingr_a_echanger;

    -- Si cette cathégorie existe on selectionne un ingrédient de cette même catégorie
    -- la recherche se fait dans la table de jointure entre ing et cat
    if v_same_categ is not null then
        select "idIngredient" into v_id_ingr_equivalent
        from "Ingredients_Categories"
        where "idCategorie" = v_same_categ
        and
              "idIngredient" != p_id_ingr_a_echanger
        and
              ROWNUM < 1;
    end if;

    -- Si on a pas de trouver d'ingrédient équivalent
    -- alors il n' y a rien à changer
    if v_id_ingr_equivalent is null then
        v_id_ingr_equivalent := p_id_ingr_a_echanger ;
    end if;

    -- on récupère le nom de l'ingrédient équivalent
    select lower("nomIngredient") into v_nom_ingr_equivalent
    from "Ingredients"
    where "idIngredient" = v_id_ingr_equivalent ;

    -- on récupère l'ensemble des attributs de la recette initiale
    select * into v_recette_init
    from "Recettes"
    where "idRecette" = p_id_recette_a_dupliquer ;

    -- on insert les informations la recette correspondant
    -- tout en adaptant le nombre de personne ainsi que les valeurs nutritionnelles
    -- lipides, protides ...ect

    v_prochain_id_recette := "RECETTES_IDRECCETE_SEQ".nextval ; -- nouvel id
    dbms_output.put_line('' || v_prochain_id_recette);
    insert into "Recettes"
    (
        "idRecette",
        "nomRecette",
        "descriptif",
        "difficulte",
        "prix",
        "nombreDePersonnes",
        "dureeTotale",
        "calories",
        "lipides",
        "glucides",
        "protides",
        "idUt"
    )
    values
    (
        v_prochain_id_recette,
        replace(lower(v_recette_init."nomRecette"), v_nom_ingr_a_echanger, v_nom_ingr_equivalent),
        replace(lower(v_recette_init."descriptif"), v_nom_ingr_a_echanger, v_nom_ingr_equivalent),
        v_recette_init."descriptif",
        v_recette_init."prix",
        p_nouveau_nb_personne,
        v_recette_init."dureeTotale",
        (v_recette_init."calories" / v_recette_init."nombreDePersonnes") * p_nouveau_nb_personne,
        (v_recette_init."lipides" / v_recette_init."nombreDePersonnes") * p_nouveau_nb_personne,
        (v_recette_init."glucides" / v_recette_init."nombreDePersonnes") * p_nouveau_nb_personne,
        (v_recette_init."glucides" / v_recette_init."nombreDePersonnes") * p_nouveau_nb_personne,
        v_recette_init."idUt"
    );

    -- on insert les étapes de la nouvelle recette
    v_prochain_id_etape := "ETAPES_IDETAPE_SEQ".nextval ;
    for ce in cur_etapes loop
        insert into "Etapes"
        (
            "idEtape",
            "nomEtape",
            "descriptionEtape",
            "dureeEtape",
            "ordre",
            "idRecette",
            "idPhase"
        )
        values
        (
            v_prochain_id_etape,
            replace(lower(ce."nomEtape"), v_nom_ingr_a_echanger, v_nom_ingr_equivalent),
            replace(lower(ce."descriptionEtape"), v_nom_ingr_a_echanger, v_nom_ingr_equivalent),
            ce."dureeEtape",
            ce."ordre",
            v_prochain_id_recette,
            ce."idPhase"
        );
    end loop;

    -- on insert les ingrédients utilisées par la nouvelle recette
    for ci in cur_ingr loop
        if ci."idIngredient" = p_id_ingr_a_echanger then
            insert into "Ingredients_Recettes"
            (
                "idRecette",
                "idIngredient",
                "quantite"
            )
            values
            (
                v_prochain_id_recette,
                ci."idIngredient",
                (ci."quantite" / v_recette_init."nombreDePersonnes") * p_nouveau_nb_personne
            );
        end if;
    end loop;

    exception
        when NO_DATA_FOUND then
            -- si pas d'ingrédient pour échanger
            v_nom_ingr_a_echanger := null ;
            -- si on a pas trouver de catégorie commun
            v_same_categ := null ;
end;
/

-- pour tester
begin
copier_recette(1, 2, 3);
end;
/