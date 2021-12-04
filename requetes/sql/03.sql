select i."nomIngredient",
    count(DISTINCT ir."idRecette") as "nb_recettes",
    count(DISTINCT ic."idCategorie") as "nb_categories"
from "Ingredients" i, "Ingredients_Recettes" ir, "Ingredients_Categories" ic
where i."idIngredient" = ir."idIngredient" 
  and i."idIngredient" = ic."idIngredient"
group by i."nomIngredient";