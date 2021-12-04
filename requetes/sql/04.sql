select u."nom", u."prenom"
from "Utilisateurs" u, "Recettes" r
where u."idUt" = r."idUt" 
    and r."idUt" 
    not in 
    (
      select r1."idUt"
      from "Recettes" r1
      where r1."idRecette" 
      in 
      (
            select ir1."idRecette"
            from "Ingredients_Recettes" ir1
            where ir1."idIngredient" 
            in 
            (
              select iir."idIngredient"
              from "Regimes" reg,
                   "Ingredients_Incompatibles_Regimes" iir
              where reg."idRegime" = iir."idRegime"
                    and reg."nomRegime" = 'Végétarien'
          )
      )
  );