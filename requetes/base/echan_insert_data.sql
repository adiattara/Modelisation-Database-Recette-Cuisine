
-- insertion de 3 utilisateur id -> 2, 3, 4
insert into "Utilisateurs" (
        "idUt",
        "login",
        "email",
        "nom",
        "prenom",
        "motDePass",
        "adresse"
) values (
        "UTILISATEURS_IDUT_SEQ".nextval,
        'Sone1988',
        'LucasMorneau@jourrapide.com',
        'Morneau',
        'Lucas',
        'ieWahKoe8na',
        '73, Rue Roussy 84100 ORANGE'
);

--u2
insert into "Utilisateurs" (
        "idUt",
        "login",
        "email",
        "nom",
        "prenom",
        "motDePass",
        "adresse"
) values (
        "UTILISATEURS_IDUT_SEQ".nextval,
        'Thersece',
        'RomainParrot@dayrep.com',
        'Parrot',
        'Romain',
        'aiD5air1c',
        '43, Avenue Millies Lacroix
97610 DZAOUDZI'
);

--u3
insert into "Utilisateurs" (
        "idUt",
        "login",
        "email",
        "nom",
        "prenom",
        "motDePass",
        "adresse"
) values (
        "UTILISATEURS_IDUT_SEQ".nextval,
        'Wasmand',
        'EleonoreProvencher@rhyta.com',
        'Provencher',
        'Éléonore',
        'afopheen5Ahw',
        '469, rue des Coudriers
03000 MOULINS'
);


-- insertion quelques unités
-- *************************

-- Aucune
insert into "Unites" (
        "idUnite",
        "nomUnite",
        "symbole"
) values (
        "UNITES_IDUNITE_SEQ".nextval,
        'Aucune',
        null
);

-- gramme
insert into "Unites" (
        "idUnite",
        "nomUnite",
        "symbole"
) values (
        "UNITES_IDUNITE_SEQ".nextval,
        'Gramme',
        'g'
);


-- insertion quelques régimes
-- **************************

insert into "Regimes" (
        "idRegime",
        "nomRegime"
) values (
        "REGIMES_IDREGIME_SEQ".nextval,
        'Végétarien'
);

insert into "Regimes" (
        "idRegime",
        "nomRegime"
) values (
        "REGIMES_IDREGIME_SEQ".nextval,
        'Sans gluten'
);

-- insertion quelques ingrédients
-- ******************************

-- eau : la vie !
insert into "Ingredients" (
        "idIngredient",
        "nomIngredient",
        "calories",
        "lipides",
        "glucides",
        "protides",
        "idUnite",
        "idUt"
) values (
        "INGREDIENTS_IDINGREDIENT_SEQ".nextval,
        'Eau',
        10,
        0,
        0,
        0,
        1,
        1   -- Morneau
);

-- Oeuf
insert into "Ingredients" (
        "idIngredient",
        "nomIngredient",
        "calories",
        "lipides",
        "glucides",
        "protides",
        "idUnite",
        "idUt"
) values (
        "INGREDIENTS_IDINGREDIENT_SEQ".nextval,
        'Oeuf',
        140,
        9.83,
        0.27,
        12.7,
        1,
        2   -- Parrot
);

-- thon
insert into "Ingredients" (
        "idIngredient",
        "nomIngredient",
        "calories",
        "lipides",
        "glucides",
        "protides",
        "idUnite",
        "idUt"
) values (
        "INGREDIENTS_IDINGREDIENT_SEQ".nextval,
        'Thon',
        138,
        9.03,
        0.27,
        10.7,
        2,
        1   -- Lucas
);

-- tilapia
insert into "Ingredients" (
        "idIngredient",
        "nomIngredient",
        "calories",
        "lipides",
        "glucides",
        "protides",
        "idUnite",
        "idUt"
) values (
        "INGREDIENTS_IDINGREDIENT_SEQ".nextval,
        'Tilapia',
        128,
        5.03,
        0.17,
        8.7,
        2,
        3   -- Éléonore
);


-- insertion quelques cathegories permettant de regrouper les ingrédients
-- **********************************************************************q

-- Autre
insert into "Categories" (
        "idCategorie",
        "nomCategorie"
) values (
        "CATEGORIES_IDCATEGORIE_SEQ".nextval,
        'Autre'
);

-- Poisson
insert into "Categories" (
        "idCategorie",
        "nomCategorie"
) values (
        "CATEGORIES_IDCATEGORIE_SEQ".nextval,
        'Poisson'
);

-- Légumes
insert into "Categories" (
        "idCategorie",
        "nomCategorie"
) values (
        "CATEGORIES_IDCATEGORIE_SEQ".nextval,
        'Légumes'
);


-- association des catégories à des ingrédients
-- *******************************************

--ic1
insert into "Ingredients_Categories" (
        "idIngredient",
        "idCategorie"
) values (
        1,
        2
);

--ic2
insert into "Ingredients_Categories" (
        "idIngredient",
        "idCategorie"
) values (
        2,
        2
);

-- ic3
insert into "Ingredients_Categories" (
        "idIngredient",
        "idCategorie"
) values (
        3,  -- thon
        2   -- poisson
);

-- ic4
insert into "Ingredients_Categories" (
        "idIngredient",
        "idCategorie"
) values (
        4,  -- tilapia
        2   -- poisson
);


-- insertion de quelques régimes pour utilisateurs
-- ***********************************************

insert into "Regimes_Utilisateurs" (
        "idRegime",
        "idUt"
)
values (
        2,
        1
);

insert into "Regimes_Utilisateurs" (
        "idRegime",
        "idUt"
)
values (
        2,
        2
);

insert into "Regimes_Utilisateurs" (
        "idRegime",
        "idUt" 
)
values (
        1,
        2
);


-- insertion de ingrédients incompatibles avec un régimes
-- ******************************************************

insert into "Ingredients_Incompatibles_Regimes" (
        "idRegime"    ,
        "idIngredient"
)
values (
        2,
        1
);

insert into "Ingredients_Incompatibles_Regimes" (
        "idRegime"     ,
        "idIngredient" 
)
values (
        2,
        2
);      


-- insertion de quelques recettes

--rc1
insert into "Recettes" (
        "idRecette",
        "nomRecette",
        "descriptif",
        "difficulte",
        "prix",
        "nombreDePersonnes",
        "dureeTotale",
        "calories",
        "lipides",
        "glucides",
        "protides",
        "idUt"
) values (
        "RECETTES_IDRECCETE_SEQ".nextval,
        'Salade de pâtes au thon',
        'Il s’agit d’une salade qui se déguste froide (donc parfaite en été lorsqu’il fait chaud). Cette salade est encore meilleure si elle est préparée la veille. Elle se conserve sans problème un jour ou deux, mais il vaut toujours mieux ne rajouter la mayonnaise qu''au moment de servir pour éviter qu''elle ne tourne.',
        'Très facile',
        2,
        3,
        40,
        709,
        8.9,
        14,
        7.6,
        2
);

--rc2
insert into "Recettes" (
        "idRecette",
        "nomRecette",
        "descriptif",
        "difficulte",
        "prix",
        "nombreDePersonnes",
        "dureeTotale",
        "calories",
        "lipides",
        "glucides",
        "protides",
        "idUt"
) values (
        "RECETTES_IDRECCETE_SEQ".nextval,
        'Bo Bun',
        'Repas viet très frais!',
        'Facile',
        2,
        4,
        35,
        509,
        8.9,
        14,
        7.6,
        3
);


-- associer quelques ingrédients des recettes
-- ******************************************

--ir1
insert into "Ingredients_Recettes" (
        "idRecette",
        "idIngredient",
        "quantite"
) values (
        1,
        2,
        3
);


--ir2
insert into "Ingredients_Recettes" (
        "idRecette",
        "idIngredient",
        "quantite"
) values (
        1,
        1,
        4
);


--ir2
insert into "Ingredients_Recettes" (
        "idRecette",
        "idIngredient",
        "quantite"
) values (
        1,  -- salades...thon
        3,  -- thon
        4
);


--ir2
insert into "Ingredients_Recettes" (
        "idRecette",
        "idIngredient",
        "quantite"
) values (
        2,
        2,
        0.2
);

--ir2
insert into "Ingredients_Recettes" (
        "idRecette",
        "idIngredient",
        "quantite"
) values (
        2,
        1,
        0.2
);


-- insertion de quelques recettes dans le planning de l'utilisateur
-- ****************************************************************

--p1
insert into "Planning_Recettes_Utilisateurs" (
        "idRecette",
        "idUt",
        "at"
) values (
        1,
        2,
        to_date('2021/11/11 10:00', 'YYYY/MM/DD HH24:MI')
);

--p2
insert into "Planning_Recettes_Utilisateurs" (
        "idRecette",
        "idUt",
        "at"
) values (
        2,
        2,
        to_date('2021/11/12 10:30', 'YYYY/MM/DD HH24:MI')
);

--p3
insert into "Planning_Recettes_Utilisateurs" (
        "idRecette",
        "idUt",
        "at"
) values (
        1,
        1,
        to_date('2021/11/11 22:30', 'YYYY/MM/DD HH24:MI')
);

--p4
insert into "Planning_Recettes_Utilisateurs" (
        "idRecette",
        "idUt",
        "at"
) values (
        2,
        3,
        to_date('2021/11/20 14:30', 'YYYY/MM/DD HH24:MI')
);


--- insertion de quelques phases

--ph1
insert into "PhasesEtapes" (
        "idPhase",
        "nomPhase"
) values (
        "PHASEETAPES_IDPHASE_SEQ".nextval,
        'Préparation'
);

--ph2
insert into "PhasesEtapes" (
        "idPhase",
        "nomPhase"
) values (
        "PHASEETAPES_IDPHASE_SEQ".nextval,
        'Repos'
);

--ph3
insert into "PhasesEtapes" (
        "idPhase",
        "nomPhase"
) values (
        "PHASEETAPES_IDPHASE_SEQ".nextval,
        'Cuisson'
);



--e1.1
insert into "Etapes" (
        "idEtape",
        "nomEtape",
        "descriptionEtape",
        "dureeEtape",
        "ordre",
        "idRecette",
        "idPhase"
) values (
        "ETAPES_IDETAPE_SEQ".nextval,
        'Etape 1',
        'Éplucher le concombre et le couper en petits dés. Le mettre dans un grand saladier. Laver les tomates, les couper en petits dés et les ajouter dans le saladier. ',
        0,
        1,
        1,
        1
);

--e1.2
insert into "Etapes" (
        "idEtape",
        "nomEtape",
        "descriptionEtape",
        "dureeEtape",
        "ordre",
        "idRecette",
        "idPhase"
) values (
        "ETAPES_IDETAPE_SEQ".nextval,
        'Etape 2',
        'Ouvrir le pot de maïs, l’égoutter dans l’évier et le verser également dans le saladier dans la même proportion que le reste (il ne faut pas mettre toute la boîte). ',
        0,
        2,
        1,
        1
);

--e1.3
insert into "Etapes" (
        "idEtape",
        "nomEtape",
        "descriptionEtape",
        "dureeEtape",
        "ordre",
        "idRecette",
        "idPhase"
) values (
        "ETAPES_IDETAPE_SEQ".nextval,
        'Etape 3',
        'Cuire les pâtes dans de l’eau légèrement salée et dans laquelle on aura versé un filet d’huile d’olive. Lorsqu’elles sont cuites, égoutter les pâtes, les laisser un peu refroidir, puis les ajouter au reste de la préparation. Mélanger. ',
        0,
        3,
        1,
        1
);

--e1.4
insert into "Etapes" (
        "idEtape",
        "nomEtape",
        "descriptionEtape",
        "dureeEtape",
        "ordre",
        "idRecette",
        "idPhase"
) values (
        "ETAPES_IDETAPE_SEQ".nextval,
        'Etape 4',
        'Ouvrir la boîte de thon, l’égoutter puis l’émietter dans sa boîte à l’aide d’un petit couteau. L’incorporer au fur et à mesure au reste de la salade.',
        0,
        4,
        1,
        1
);

--e1.5
insert into "Etapes" (
        "idEtape",
        "nomEtape",
        "descriptionEtape",
        "dureeEtape",
        "ordre",
        "idRecette",
        "idPhase"
) values (
        "ETAPES_IDETAPE_SEQ".nextval,
        'Etape 5',
        'Bien mélanger le tout et y ajouter de la mayonnaise juste avant de servir',
        0,
        5,
        1,
        1
);