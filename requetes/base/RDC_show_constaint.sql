-- récuperer les contraints d'une table

SELECT
        constraint_name,
        constraint_type
FROM
        user_constraints
WHERE
                constraint_type = 'C'
  AND table_name = 'Etapes';