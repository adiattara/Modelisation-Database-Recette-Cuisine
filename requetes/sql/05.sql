SELECT
  "login",
  "prenom",
  "nom",
  "email",
  "adresse",
  (SELECT COUNT("Recettes"."idUt")
    FROM "Recettes"
    WHERE "Recettes"."idUt" = "Utilisateurs"."idUt") AS "nombre de recettes crées",
  (SELECT COUNT(*)
    FROM "Ingredients_Utilisateurs" iut
    WHERE iut."idUt" = "Utilisateurs"."idUt") AS "nb ingrédients possédés ",
  (SELECT COUNT(*)
    FROM "Planning_Recettes_Utilisateurs" p
    WHERE p."idUt"= "Utilisateurs"."idUt" AND "at" >= SYSDATE) AS "nb recettes prévu de réaliser"
  FROM "Utilisateurs";