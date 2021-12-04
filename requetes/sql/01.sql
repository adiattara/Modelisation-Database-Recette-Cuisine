select  "idRecette" ,"nomRecette" 
from "Recettes"  r
where(r."calories"/r."nombreDePersonnes") < 200
and r."idRecette" 
in 
(
    select ir."idRecette" 
    from "Ingredients_Recettes" ir
    where ir."idIngredient" 
    in (
        select iir."idIngredient" 
        from "Ingredients_Incompatibles_Regimes" iir
        where iir."idRegime" 
        in (
            select rg."idRegime" 
            from "Regimes" rg 
            where 
                rg."nomRegime"='Sans gluten'
                and 
                rg."idRegime" 
                in (
                    select ru."idRegime" 
                    from "Regimes_Utilisateurs" ru  
                    where ru."idUt" 
                    in (
                        select pru."idUt" 
                        from "Planning_Recettes_Utilisateurs" pru )))));



-- SELECT "idRecette", "nomRecette"
--   FROM "Recettes" r
--   WHERE ("calories" / "nombreDePersonnes") < 200
--     AND r."idRecette" NOT IN (
--       SELECT "idRecette"
--         FROM "Recettes"
--         WHERE "idRecette" IN (
--           SELECT "idRecette"
--             FROM "Ingredients_Recettes"
--             WHERE "idIngredient" IN (
--               SELECT iir."idIngredient"
--                 FROM "Regimes" r, "Ingredients_Incompatibles_Regimes" iir
--                 WHERE r."idRecette" = iir."idRegime" AND r."nomRegime" = 'Sans gluten'
--             )
--         )
--     )
--     AND r."idRecette" IN (
--       SELECT DISTINCT "idRecette"
--       FROM "Planning_Recettes_Utilisateurs"
--       WHERE "idRecette" = r."idRecette"
--     );