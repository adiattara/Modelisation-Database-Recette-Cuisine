--@rdc_create_seq.sql
-- insertion d'utilisateurs
--u1

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

--u4
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
        'Claying',
        'YoletteLeclerc@dayrep.com ',
        'Leclerc',
        'Yolette',
        'iquoh3Rei',
        '80, route de Lyon
13800 ISTRES'
);

--u5
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
        'Suppe1994',
        'VarieurAstrid@dayrep.com ',
        'Varieur',
        'Astrid',
        'Ung8aemoo',
        '61, rue des Nations Unies
93200 SAINT-DENIS'
);

--u6
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
        'Hision',
        'LoringChauvin@dayrep.com',
        'Chauvin',
        'Loring',
        'aex4ahPhec',
        '17, Place Napoléon
93150 LE BLANC-MESNIL'
);

--u7
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
        'Herfoust',
        'VedetteCormier@rhyta.com ',
        'Cormier',
        'Vedette',
        'oht0Sieng',
        '2, rue Cazade
59240 DUNKERQUE'
);

--u8
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
        'Manger',
        'ChristianeGiguere@teleworm.us',
        'Giguère',
        'Christiane',
        'Xiagh7goh2f',
        '28, rue Ernest Renan
49300 CHOLET '
);

--u9
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
        'Hatifix',
        'MargauxLamy@armyspy.com',
        'Lamy',
        'Margaux',
        'heichaeZ3',
        '97, rue Petite Fusterie
01000 BOURG-EN-BRESSE'
);

--u10
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
        'Enclither',
        'LoringCarignan@rhyta.com ',
        'Carignan',
        'Loring',
        'EpeiNgikei7',
        '12, rue Goya
72100 LE MANS'
);

-- insertion quelques unités

--ut1
insert into "Unites" (
        "idUnite",
        "nomUnite",
        "symbole"
) values (
        "UNITES_IDUNITE_SEQ".nextval,
        'Aucune',
        null
);

--ut2
insert into "Unites" (
        "idUnite",
        "nomUnite",
        "symbole"
) values (
        "UNITES_IDUNITE_SEQ".nextval,
        'Gramme',
        'g'
);

--ut3
insert into "Unites" (
        "idUnite",
        "nomUnite",
        "symbole"
) values (
        "UNITES_IDUNITE_SEQ".nextval,
        'Kilogramme',
        'kg'
);

--ut4
insert into "Unites" (
        "idUnite",
        "nomUnite",
        "symbole"
) values (
        "UNITES_IDUNITE_SEQ".nextval,
        'Litre',
        'l'
);

--ut5
insert into "Unites" (
        "idUnite",
        "nomUnite",
        "symbole"
) values (
        "UNITES_IDUNITE_SEQ".nextval,
        'Cuillère à Café',
        'csp'
);

--ut6
insert into "Unites" (
        "idUnite",
        "nomUnite",
        "symbole"
) values (
        "UNITES_IDUNITE_SEQ".nextval,
        'Tonne',
        't'
);

--ut7
insert into "Unites" (
        "idUnite",
        "nomUnite",
        "symbole"
) values (
        "UNITES_IDUNITE_SEQ".nextval,
        'cuillère à dessert',
        'dsp'
);

--ut8
insert into "Unites" (
        "idUnite",
        "nomUnite",
        "symbole"
) values (
        "UNITES_IDUNITE_SEQ".nextval,
        'Bol',
        'bol'
);

--ut9
insert into "Unites" (
        "idUnite",
        "nomUnite",
        "symbole"
) values (
        "UNITES_IDUNITE_SEQ".nextval,
        'Tasse',
        'tas'
);

--ut10
insert into "Unites" (
        "idUnite",
        "nomUnite",
        "symbole"
) values (
        "UNITES_IDUNITE_SEQ".nextval,
        'Millilitre',
        'ml'
);

-- insertion quelques régimes

--rg1
insert into "Regimes" (
        "idRegime",
        "nomRegime"
) values (
        "REGIMES_IDREGIME_SEQ".nextval,
        'Acido-basique'
);

--rg2
insert into "Regimes" (
        "idRegime",
        "nomRegime"
) values (
        "REGIMES_IDREGIME_SEQ".nextval,
        'Cétogène'
);

--rg3
insert into "Regimes" (
        "idRegime",
        "nomRegime"
) values (
        "REGIMES_IDREGIME_SEQ".nextval,
        'Paléo'
);

--rg4
insert into "Regimes" (
        "idRegime",
        "nomRegime"
) values (
        "REGIMES_IDREGIME_SEQ".nextval,
        'Sans gluten'
);

--rg5
insert into "Regimes" (
        "idRegime",
        "nomRegime"
) values (
        "REGIMES_IDREGIME_SEQ".nextval,
        'Sans lactose'
);

--rg6
insert into "Regimes" (
        "idRegime",
        "nomRegime"
) values (
        "REGIMES_IDREGIME_SEQ".nextval,
        'Fractionné'
);

--rg7
insert into "Regimes" (
        "idRegime",
        "nomRegime"
) values (
        "REGIMES_IDREGIME_SEQ".nextval,
        'Végétarien'
);

--rg8
insert into "Regimes" (
        "idRegime",
        "nomRegime"
) values (
        "REGIMES_IDREGIME_SEQ".nextval,
        'Halal'
);

--rg9
insert into "Regimes" (
        "idRegime",
        "nomRegime"
) values (
        "REGIMES_IDREGIME_SEQ".nextval,
        'Flexitarien'
);

--rg10
insert into "Regimes" (
        "idRegime",
        "nomRegime"
) values (
        "REGIMES_IDREGIME_SEQ".nextval,
        'The zone'
);

-- insertion quelques ingrédients

--ing1
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
        4,
        8
);

--ing2
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
        2
);

--ing3
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
        'Ail',
        131,
        0.34,
        21.2,
        5.81,
        2,
        5
);

--ing4
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
        'Abats',
        165,
        5,
        0.9,
        27,
        2,
        7
);

--ing5
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
        'Agneau',
        280,
        24,
        0.0,
        19.1,
        2,
        1
);

--ing6
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
        'Lait de poule',
        224,
        10.6,
        20.4,
        11.6,
        10,
        9
);

--ing7
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
        'arachide',
        101,
        8.5,
        2.2,
        3.8,
        4,
        3
);

--ing8
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
        'Nectar de tamarin',
        143,
        0.3,
        37.0,
        0.2,
        4,
        2
);

--ing9
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
        'thon',
        130,
        0.6,
        0.0,
        29.2,
        4,
        5
);

--ing10
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
        'Lotte',
        97,
        1,
        0.0,
        18.6,
        4,
        7
);

--ing11
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
        'Tomate',
        103,
        0.5,
        24.4,
        3.8,
        4,
        7
);

-- insertion quelques cathegories permettant de regrouper les ingrédients

--cat1 (Autres)
insert into "Categories" (
        "idCategorie",
        "nomCategorie"
) values (
        "CATEGORIES_IDCATEGORIE_SEQ".nextval,
        'Autre'
);

--cat2 (Poisson)
insert into "Categories" (
        "idCategorie",
        "nomCategorie"
) values (
        "CATEGORIES_IDCATEGORIE_SEQ".nextval,
        'Poisson'
);

--cat3 (Légumes)
insert into "Categories" (
        "idCategorie",
        "nomCategorie"
) values (
        "CATEGORIES_IDCATEGORIE_SEQ".nextval,
        'Légumes'
);

--cat4 (volaille)
insert into "Categories" (
        "idCategorie",
        "nomCategorie"
) values (
        "CATEGORIES_IDCATEGORIE_SEQ".nextval,
        'Volaille'
);

--cat5 (fruit)
insert into "Categories" (
        "idCategorie",
        "nomCategorie"
) values (
        "CATEGORIES_IDCATEGORIE_SEQ".nextval,
        'Fruit'
);

--cat6 (viandes)
insert into "Categories" (
        "idCategorie",
        "nomCategorie"
) values (
        "CATEGORIES_IDCATEGORIE_SEQ".nextval,
        'Viande'
);

--cat7 (laitié)
insert into "Categories" (
        "idCategorie",
        "nomCategorie"
) values (
        "CATEGORIES_IDCATEGORIE_SEQ".nextval,
        'Laitié'
);

--cat8 (Gras)
insert into "Categories" (
        "idCategorie",
        "nomCategorie"
) values (
        "CATEGORIES_IDCATEGORIE_SEQ".nextval,
        'Gras'
);

-- insertion dans la table de jointure ingredients cathegories

--ic1
insert into "Ingredients_Categories" (
        "idIngredient",
        "idCategorie"
) values (
        1,
        1
);

--ic2
insert into "Ingredients_Categories" (
        "idIngredient",
        "idCategorie"
) values (
        2,
        4
);

--ic3
insert into "Ingredients_Categories" (
        "idIngredient",
        "idCategorie"
) values (
        3,
        1
);

--ic4
insert into "Ingredients_Categories" (
        "idIngredient",
        "idCategorie"
) values (
        4,
        1
);

--ic5
insert into "Ingredients_Categories" (
        "idIngredient",
        "idCategorie"
) values (
        5,
        6
);

--ic6
insert into "Ingredients_Categories" (
        "idIngredient",
        "idCategorie"
) values (
        6,
        7
);

--ic7
insert into "Ingredients_Categories" (
        "idIngredient",
        "idCategorie"
) values (
        7,
        8
);

--ic8
insert into "Ingredients_Categories" (
        "idIngredient",
        "idCategorie"
) values (
        8,
        1
);

--ic9
insert into "Ingredients_Categories" (
        "idIngredient",
        "idCategorie"
) values (
        9,
        2
);

--ic10
insert into "Ingredients_Categories" (
        "idIngredient",
        "idCategorie"
) values (
        10,
        2
);

--ic11
insert into "Ingredients_Categories" (
        "idIngredient",
        "idCategorie"
) values (
        11,
        3
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

--- insertion de quelques élément dans la table des ingrédient des recetttes

--ir1
insert into "Ingredients_Recettes" (
        "idRecette",
        "idIngredient",
        "quantite"
) values (
        1,
        9,
        3
);

--ir1
insert into "Ingredients_Recettes" (
        "idRecette",
        "idIngredient",
        "quantite"
) values (
        1,
        11,
        4
);

--ir1
insert into "Ingredients_Recettes" (
        "idRecette",
        "idIngredient",
        "quantite"
) values (
        1,
        2,
        4
);

--ir1
insert into "Ingredients_Recettes" (
        "idRecette",
        "idIngredient",
        "quantite"
) values (
        1,
        6,
        2
);

--ir2
insert into "Ingredients_Recettes" (
        "idRecette",
        "idIngredient",
        "quantite"
) values (
        2,
        7,
        0.2
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

--- insertion de quelques étapes de recette

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

--e2.1
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
        'Cisailler la viande en tranches très fines, et faire mariner au frigo avec le curry, ail, glutamate et les sauces, au moins 30 mn.',
        0,
        1,
        2,
        1
);

--e2.2
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
        'Pendant ce temps préparer la sauce, si vous cuisinez souvent asiatique, doubler les proportions et conservez-là dans un bocal. Vous pouvez ajouter une pointe de piment (sauce chili) pour la parfumer. Faire bouillir tous les ingrédients et réserver.',
        0,
        2,
        2,
        1
);

--e2.3
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
        'Pour les vermicelles, faire bouillir une bonne casserole d''eau. Y plonger les vermicelles 3 à 4 mn. Egoutter et les ranger par poignée.',
        5,
        3,
        2,
        3
);

--e2.4
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
        'Faire revenir la viande dans un peu d''huile, à feu très fort et très brièvement : la viande doit être saisie simplement, pour la garder tendre.',
        0,
        4,
        2,
        1
);

--e2.5
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
        2,
        1
);

--- insertion de quelques recettes dans le planning de l'utilisateur

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


-- insertion de régimes des utilisateurs

insert into "Regimes_Utilisateurs" (
        "idRegime",
        "idUt"
)
values (
        4,
        1
);

insert into "Regimes_Utilisateurs" (
        "idRegime",
        "idUt"
)
values (
        4,
        2
);


insert into "Regimes_Utilisateurs" (
        "idRegime",
        "idUt"
)
values (
        1,
        3
);

insert into "Regimes_Utilisateurs" (
        "idRegime",
        "idUt"
)
values (
        6,
        4       
);


-- insertion de ingrédients incompatible avec un régimes

insert into "Ingredients_Incompatibles_Regimes" (
        "idRegime"    ,
        "idIngredient"
)
values (
        4,
        1
);

insert into "Ingredients_Incompatibles_Regimes" (
        "idRegime"     ,
        "idIngredient" 
)
values (
        4,
        2
);      

insert into "Ingredients_Incompatibles_Regimes" (
        "idRegime"     ,
        "idIngredient" 
)
values (
        4,
        3
);