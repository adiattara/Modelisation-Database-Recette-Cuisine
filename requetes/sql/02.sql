-- La recette la plus souvent présente dans des plannings d’utilisateurs.
select r."nomRecette"
from "Recettes" r
where "idRecette" in (
    select pl."idRecette"
    from "Planning_Recettes_Utilisateurs" pl
    having count(pl."idRecette") = (
        select max(count(pl."idRecette"))
        from "Planning_Recettes_Utilisateurs"
        group by pl."idRecette"
    )
    group by r."idRecette"
);

select 'delete on table' || table_name || 'cascade constraints;' from user_tables;