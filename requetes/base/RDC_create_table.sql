-- création de la table PhasesEtapes
create table "PhasesEtapes" (
        "idPhase"  number(10, 0) not null,
        "nomPhase" varchar2(100) not null,
        constraint phasesetapes_pk primary key ( "idPhase" ),
        constraint phasesetapes_uq unique ( "nomPhase" )
);

-- création de la table Etapes
create table "Etapes" (
        "idEtape"          number(10, 0) not null,
        "nomEtape"         varchar2(255) not null,
        "descriptionEtape" varchar2(4000),
        "dureeEtape"       number(10, 0) not null,
        "ordre"            number(10, 0) not null,
        "idRecette"        number(10, 0) not null,
        "idPhase"          number(10, 0) not null,
        constraint etapes_pk primary key ( "idEtape" ),
        constraint etapes_dur_ck check ( "dureeEtape" >= 0 ),
        constraint etapes_ord_ck check ( "ordre" >= 0 )
);

-- création de la table Recettes
create table "Recettes" (
        "idRecette"         number(10, 0) not null,
        "nomRecette"        varchar2(255) not null,
        "descriptif"        varchar2(4000),
        "difficulte"        varchar2(255) not null,
        "prix"              number(10, 0) not null,
        "nombreDePersonnes" number(10, 0) not null,
        "dureeTotale"       number(10, 0) not null,
        "calories"          number(10, 0) not null,
        "lipides"           decimal(10, 5) not null,
        "glucides"          decimal(10, 5) not null,
        "protides"          decimal(10, 5) not null,
        "idUt"              number(10, 0) not null,
        constraint recettes_pk primary key ( "idRecette" ),
        constraint recettes_diff_ck check ( "difficulte" in ( 'Très facile', 'Facile', 'Intermédiaire', 'Difficile', 'Très difficile' ) ),
        constraint recettes_prix_ck check ( "prix" between 1 and 5 ),
        constraint recettes_pers_ck check ( "nombreDePersonnes" > 0 ),
        constraint recettes_dur_ck check ( "dureeTotale" > 0 ),
        constraint recettes_cal_ck check ( "calories" >= 0 ),
        constraint recettes_lip_ck check ( "lipides" >= 0 ),
        constraint recettes_glu_ck check ( "glucides" >= 0 ),
        constraint recettes_pro_ck check ( "protides" >= 0 )
);

-- création de la table Medias
create table "Medias" (
        "idMedia"   number(10, 0) not null,
        "url"       varchar2(255) not null,
        "idRecette" number(10, 0) not null,
        "idType"    number(10, 0) not null,
        constraint medias_pk primary key ( "idMedia" )
);

-- création de la table Types
create table "Types" (
        "idType"  number(10, 0) not null,
        "nomType" varchar2(255) not null,
        constraint types_pk primary key ( "idType" ),
        constraint types_uq unique ( "nomType" )
);

-- création de la table Categories
create table "Categories" (
        "idCategorie"  number(10, 0) not null,
        "nomCategorie" varchar2(255) not null,
        constraint categories_pk primary key ( "idCategorie" ),
        constraint categories_uq unique ( "nomCategorie" )
);

-- création de la table Ingredients_Categories
create table "Ingredients_Categories" (
        "idIngredient" number(10, 0) not null,
        "idCategorie"  number(10, 0) not null,
        constraint ingredients_categories_pk primary key ( "idIngredient",
                                                           "idCategorie" )
);

-- création de la table Ingredients
create table "Ingredients" (
        "idIngredient"  number(10, 0) not null,
        "nomIngredient" varchar2(255) not null,
        "calories"      number(10, 0) not null,
        "lipides"       decimal(10, 5) not null,
        "glucides"      decimal(10, 5) not null,
        "protides"      decimal(10, 5) not null,
        "idUnite"       number(10, 0) not null,
        "idUt"          number(10, 0) not null,
        constraint ingredients_pk primary key ( "idIngredient" ),
        constraint ingredients_uq unique ( "nomIngredient" ),
        constraint ingredients_cal_ck check ( "calories" >= 0 ),
        constraint ingredients_lip_ck check ( "lipides" >= 0 ),
        constraint ingredients_glu_ck check ( "glucides" >= 0 ),
        constraint ingredients_pro_ck check ( "protides" >= 0 )
);

-- création de la table Unites
create table "Unites" (
        "idUnite"  number(10, 0) not null,
        "nomUnite" varchar2(255) not null,
        "symbole"  varchar2(10),
        constraint unites_pk primary key ( "idUnite" ),
        constraint unites_uq unique ( "nomUnite",
                                      "symbole" )
);

-- création de la table Ingredients_Incompatibles_Regimes
create table "Ingredients_Incompatibles_Regimes" (
        "idRegime"     number(10, 0) not null,
        "idIngredient" number(10, 0) not null,
        constraint ingredients_incompatibles_regimes_pk primary key ( "idRegime",
                                                                      "idIngredient" )
);

-- création de la table Regimes
create table "Regimes" (
        "idRegime"  number(10, 0) not null,
        "nomRegime" varchar2(255) not null,
        constraint regimes_pk primary key ( "idRegime" ),
        constraint regimes_uq unique ( "nomRegime" )
);

-- création de la table Utilisateurs
create table "Utilisateurs" (
        "idUt"      number(10, 0) not null,
        "login"     varchar2(255) not null,
        "email"     varchar2(255) not null,
        "nom"       varchar2(255) not null,
        "prenom"    varchar2(255) not null,
        "motDePass" varchar2(255) not null,
        "adresse"   varchar2(255),
        constraint utilisateurs_pk primary key ( "idUt" ),
        constraint utilisateurs_uq unique ( "login",
                                            "email" ),
        constraint utilisateurs_mai_ck check ( "email" like '%_@_%' )
);

-- création de la table Regimes_Utilisateurs
create table "Regimes_Utilisateurs" (
        "idRegime" number(10, 0) not null,
        "idUt"     number(10, 0) not null,
        constraint regimes_utilisateurs_pk primary key ( "idRegime",
                                                         "idUt" )
);

-- création de la table Ingrédients_A_Acheter_Utilisateurs_Archive
create table "Ingredients_A_Acheter_Utilisateurs_Archive" (
        "idIngredient" number(10, 0) not null,
        "idUt"         number(10, 0) not null,
        "quantite"     decimal(10, 5) not null,
        "date"         date not null,
        constraint ingredients_a_acheter_utilisateurs_archive_pk primary key ( "idIngredient",
                                                                               "idUt" ),
        constraint ingredients_a_acheter_utilisateurs_archive_qte_ck check ( "quantite" >= 0 )
);

-- création de la table Ingredients_A_Acheter_Utilisateurs
create table "Ingredients_A_Acheter_Utilisateurs" (
        "idUt"         number(10, 0) not null,
        "idIngredient" number(10, 0) not null,
        "quantite"     decimal(10, 5) not null,
        "date"         date not null,
        constraint ingredients_a_acheter_utilisateurs_pk primary key ( "idUt",
                                                                       "idIngredient" ),
        constraint ingredients_a_acheter_utilisateurs_qte_ck check ( "quantite" >= 0 )
);

-- création de la table Ingredients_Utilisateurs
create table "Ingredients_Utilisateurs" (
        "idUt"         number(10, 0) not null,
        "idIngredient" number(10, 0) not null,
        "quantite"     decimal(10, 5) not null,
        constraint ingredients_utilisateurs_pk primary key ( "idUt",
                                                             "idIngredient" ),
        constraint ingredients_utilisateurs_qte_ck check ( "quantite" >= 0 )
);

-- création de la table Ingredients_Recettes
create table "Ingredients_Recettes" (
        "idRecette"    number(10, 0) not null,
        "idIngredient" number(10, 0) not null,
        "quantite"     decimal(10, 5) not null,
        constraint ingredients_recettes_pk primary key ( "idRecette",
                                                         "idIngredient" ),
        constraint ingredients_recettes_qte_ck check ( "quantite" >= 0 )
);

-- création de la table Planning_Recettes_Archive
create table "Planning_Recettes_Archive" (
        "idRecette" number(10, 0) not null,
        "idUt"      number(10, 0) not null,
        "at"        date not null,
        constraint planning_recettes_archive_pk primary key ( "idRecette",
                                                              "idUt",
                                                              "at" )
);

-- création de la table Planning_Recette_Utilisateurs
create table "Planning_Recettes_Utilisateurs" (
        "idRecette" number(10, 0) not null,
        "idUt"      number(10, 0) not null,
        "at"        date not null,
        constraint planning_recettes_utilisateurs_pk primary key ( "idRecette",
                                                                   "idUt",
                                                                   "at" )
);

/*
	SPECIFICATION DES CONTRAINTES DE CLES ETRANGERES
*/

alter table "Etapes"
        add constraint "Etapes_fk0" foreign key ( "idRecette" )
                references "Recettes" ( "idRecette" );

alter table "Etapes"
        add constraint "Etapes_fk1" foreign key ( "idPhase" )
                references "PhasesEtapes" ( "idPhase" );

alter table "Recettes"
        add constraint "Recettes_fk0" foreign key ( "idUt" )
                references "Utilisateurs" ( "idUt" );

alter table "Medias"
        add constraint "Medias_fk0" foreign key ( "idRecette" )
                references "Recettes" ( "idRecette" );

alter table "Medias"
        add constraint "Medias_fk1" foreign key ( "idType" )
                references "Types" ( "idType" );

alter table "Ingredients_Categories"
        add constraint "Ingredients_Categories_fk0" foreign key ( "idIngredient" )
                references "Ingredients" ( "idIngredient" );

alter table "Ingredients_Categories"
        add constraint "Ingredients_Categories_fk1" foreign key ( "idCategorie" )
                references "Categories" ( "idCategorie" );

alter table "Ingredients"
        add constraint "Ingredients_fk0" foreign key ( "idUnite" )
                references "Unites" ( "idUnite" );

alter table "Ingredients"
        add constraint "Ingredients_fk1" foreign key ( "idUt" )
                references "Utilisateurs" ( "idUt" );

alter table "Ingredients_Incompatibles_Regimes"
        add constraint "Ingredients_Incompatibles_Regimes_fk0" foreign key ( "idIngredient" )
                references "Ingredients" ( "idIngredient" );

alter table "Ingredients_Incompatibles_Regimes"
        add constraint "Ingredients_Incompatibles_Regimes_fk1" foreign key ( "idRegime" )
                references "Regimes" ( "idRegime" );

alter table "Regimes_Utilisateurs"
        add constraint "Regimes_Utilisateurs_fk0" foreign key ( "idRegime" )
                references "Regimes" ( "idRegime" );

alter table "Regimes_Utilisateurs"
        add constraint "Regimes_Utilisateurs_fk1" foreign key ( "idUt" )
                references "Utilisateurs" ( "idUt" );

alter table "Ingredients_A_Acheter_Utilisateurs_Archive"
        add constraint "Ingredients_A_Acheter_Utilisateurs_Archive_fk0" foreign key ( "idIngredient" )
                references "Ingredients" ( "idIngredient" );

alter table "Ingredients_A_Acheter_Utilisateurs_Archive"
        add constraint "Ingredients_A_Acheter_Utilisateurs_Archive_fk1" foreign key ( "idUt" )
                references "Utilisateurs" ( "idUt" );

alter table "Ingredients_A_Acheter_Utilisateurs"
        add constraint "Ingredients_A_Acheter_Utilisateurs_fk0" foreign key ( "idUt" )
                references "Utilisateurs" ( "idUt" );

alter table "Ingredients_A_Acheter_Utilisateurs"
        add constraint "Ingredients_A_Acheter_Utilisateurs_fk1" foreign key ( "idIngredient" )
                references "Ingredients" ( "idIngredient" );

alter table "Ingredients_Utilisateurs"
        add constraint "Ingredients_Utilisateurs_fk0" foreign key ( "idUt" )
                references "Utilisateurs" ( "idUt" );

alter table "Ingredients_Utilisateurs"
        add constraint "Ingredients_Utilisateurs_fk1" foreign key ( "idIngredient" )
                references "Ingredients" ( "idIngredient" );

alter table "Ingredients_Recettes"
        add constraint "Ingredients_Recettes_fk0" foreign key ( "idRecette" )
                references "Recettes" ( "idRecette" );

alter table "Ingredients_Recettes"
        add constraint "Ingredients_Recettes_fk1" foreign key ( "idIngredient" )
                references "Ingredients" ( "idIngredient" );

alter table "Planning_Recettes_Archive"
        add constraint "Planning_Recettes_Archive_fk0" foreign key ( "idRecette" )
                references "Recettes" ( "idRecette" );

alter table "Planning_Recettes_Archive"
        add constraint "Planning_Recettes_Archive_fk1" foreign key ( "idUt" )
                references "Utilisateurs" ( "idUt" );

alter table "Planning_Recettes_Utilisateurs"
        add constraint "Planning_Recettes_Utilisateurs_fk0" foreign key ( "idRecette" )
                references "Recettes" ( "idRecette" );

alter table "Planning_Recettes_Utilisateurs"
        add constraint "Planning_Recettes_Utilisateurs_fk1" foreign key ( "idUt" )
                references "Utilisateurs" ( "idUt" );