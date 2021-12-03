-- suppression de la table PhasesEtapes
DROP TABLE  "PhasesEtapes" cascade constraints;

-- suppression de la table Etapes
DROP TABLE  "Etapes" cascade constraints;

-- suppression de la table Recettes
DROP TABLE  "Recettes" cascade constraints;

-- suppression de la table Medias
DROP TABLE  "Medias" cascade constraints;

-- suppression de la table Types
DROP TABLE  "Types" cascade constraints;

-- suppression de la table Categories
DROP TABLE  "Categories" cascade constraints;

-- suppression de la table Ingredients_Categories
DROP TABLE  "Ingredients_Categories" cascade constraints;

-- suppression de la table Ingredients
DROP TABLE  "Ingredients" cascade constraints;

-- suppression de la table Unites
DROP TABLE  "Unites" cascade constraints;

-- suppression de la table Ingredients_Incompatibles_Regimes
DROP TABLE  "Ingredients_Incompatibles_Regimes" cascade constraints;

-- suppression de la table Regimes
DROP TABLE  "Regimes" cascade constraints;

-- suppression de la table Utilisateurs
DROP TABLE  "Utilisateurs" cascade constraints;

-- suppression de la table Regimes_Utilisateurs
DROP TABLE  "Regimes_Utilisateurs" cascade constraints;

-- suppression de la table Ingrédients_A_Acheter_Utilisateurs_Archive
DROP TABLE  "Ingredients_A_Acheter_Utilisateurs_Archive" cascade constraints;

-- suppression de la table Ingredients_A_Acheter_Utilisateurs
DROP TABLE  "Ingredients_A_Acheter_Utilisateurs" cascade constraints;

-- suppression de la table Ingredients_Utilisateurs
DROP TABLE  "Ingredients_Utilisateurs" cascade constraints;

-- suppression de la table Ingredients_Recettes
DROP TABLE  "Ingredients_Recettes" cascade constraints;

-- suppression de la table Planning_Recettes_Archive
DROP TABLE  "Planning_Recettes_Archive" cascade constraints;

-- suppression de la table Planning_Recette_Utilisateurs
DROP TABLE  "Planning_Recettes_Utilisateurs" cascade constraints;