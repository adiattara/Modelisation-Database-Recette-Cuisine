-- 4.définir une fonction qui retourne un booléen si la recette est compatible avec un régime
CREATE OR REPLACE FUNCTION test_recette_with_regime(
    recette_id IN "Recettes"."idRecette"%TYPE,
    regime_name IN "Regimes"."nomRegime"%TYPE
) RETURN BOOLEAN IS
BEGIN
    DECLARE
        result BOOLEAN := TRUE;
        CURSOR recette_cursor IS
            SELECT ir."idRecette"
            FROM "Ingredients_Recettes" ir
            WHERE ir."idIngredient" IN (
                SELECT iir."idIngredient"
                FROM "Regimes" reg,
                     "Ingredients_Incompatibles_Regimes" iir
                WHERE reg."idRegime" = iir."idRegime"
                  AND UPPER(reg."nomRegime") = UPPER(regime_name)
            );
    BEGIN

        FOR recette_line IN recette_cursor
            LOOP
                IF recette_line."idRecette" = recette_id THEN
                    result := FALSE;
                END IF;
            END LOOP;

        RETURN result;
    END;
END;