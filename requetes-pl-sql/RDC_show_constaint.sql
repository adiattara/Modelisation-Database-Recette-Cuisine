-- récuperer les contraints d'une table

SELECT
        constraint_name,
        constraint_type
FROM
        user_constraints
WHERE
                table_name = 'Etapes'
        AND constraint_type = 'C';