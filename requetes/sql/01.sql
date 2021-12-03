select "idRecette", "nomRecette"
from "Recettes" r
where ("calories" / "nombreDePersonnes") < 200
  and r."idRecette" not in (
    select "idRecette"
    from "Recettes"
    where r."idRecette" in (
        select r."idRecette"
        from "Ingredients_Recettes"
        where "idIngredient" in (
            select iir."idIngredient"
            from "Regimes" r,
                 "Ingredients_Incompatibles_Regimes" iir
            where r."idRecette" = iir."idRegime"
              and r."nomRegime" = 'Sans gluten'
        )
    )
      and r."idRecette" in (
        select distinct r."idRecette"
        from "Planning_Recettes_Utilisateurs" pu
        where r."idRecette" = pu."idRecette"
    )
);