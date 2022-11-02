----------------------------------------------------------------------------------------------------
--------------------------------------- CONFIG -----------------------------------------------------
-- VORP INVENTORY LUA*

Config = {

  Debug = false, -- if your server is live set this to false.  to true only if you are testing things
  DevMode = false, -- if your server is live set this to false.  to true only if you are testing things (auto load inventory when script restart and before character selection. Alos add /getInv command)

  defaultlang = "fr_lang",
  dbupdater = true,
  ShowCharacterNameOnGive = false, -- when giving an item, show the character name of nearby players instead of their player ID. if set to false, show the player ID

  DoubleClickToUse = true, -- if toggled to false, items in inventory will right click then left click "use"
  
  NewPlayers = false, --- if you dont want new players to give money or items then set to true. this can avoid cheaters giving stuff on first join

  -- items that dont get added up torwards your max weapon count
  notweapons = {
    "WEAPON_KIT_BINOCULARS_IMPROVED",
    "WEAPON_KIT_BINOCULARS",
    "WEAPON_FISHINGROD",
    "WEAPON_KIT_CAMERA",
    "WEAPON_kIT_CAMERA_ADVANCED",
    "WEAPON_MELEE_LANTERN",
    "WEAPON_MELEE_DAVY_LANTERN",
    "WEAPON_MELEE_LANTERN_HALLOWEEN",
    "WEAPON_KIT_METAL_DETECTOR",
    "WEAPON_MELEE_HAMMER",
    "WEAPON_MELEE_KNIFE",
  },
  -- GOLD ITEM LIKE DOLLARS
  UseGoldItem = false,
  AddGoldItem = false, -- Should there be an item in inventory to represent gold
  AddDollarItem = true, -- Should there be an item in inventory to represent dollars
  AddAmmoItem = true, -- Should there be an item in inventory to represent the gun belt

  InventorySearchable = true, -- Should the search bar appear in inventories
  InventorySearchAutoFocus = true, -- Search autoofocuses when you type
  -- DEATH FUNCTIONS
  DisableDeathInventory = true, -- prevent the ability to access inventory while dead

  --{ I } OPEN INVENTORY
  OpenKey = 0xC1989F95,

  --RMB mouse PROMPT PICKUP
  PickupKey = 0xF84FA74F,

  -- LOGS
  webhookavatar = "",
  webhook = "",
  discordid = true, -- turn to true if ur using discord whitelist

  -- WEBHOOK LANGUAGE
  Language = {
    gaveitem = "item transfer",
    gave = " transfered ",
    to = " to ",
    withid = " with the weapon ID: ",
  },

  -- NEED TO TEST
  DropOnRespawn = {
    AllMoney   = false,
    PartMoney = false,
    PartPercentage = 25,
    Gold    = false, -- TRUE ONLY IF UseGoldItem = true
    Weapons = false,
    Items   = false
  },

  -- HOW MANY WEAPONS AND ITEMS ALLOWED PER PLAYER
  MaxItemsInInventory = {
    Weapons = 6,
    Items = 200,
  },


  -- FIRST JOIN
  startItems = {
    consumable_raspberrywater = 2, --ITEMS SAME NAME AS IN DATABASE
    ammorevolvernormal = 1 --AMMO SAME NAME AS I NTHE DATABASE
  },

  startWeapons = {
    WEAPON_MELEE_KNIFE = {} --WEAPON HASH NAME
  },

  Ammotypes = { 
    ["416676503"] = {"AMMO_PISTOL","AMMO_PISTOL_EXPRESS","AMMO_PISTOL_EXPRESS_EXPLOSIVE","AMMO_PISTOL_HIGH_VELOCITY","AMMO_PISTOL_SPLIT_POINT"},
    ["-594562071"] = {"AMMO_REPEATER","AMMO_REPEATER_EXPRESS","AMMO_REPEATER_EXPRESS_EXPLOSIVE","AMMO_REPEATER_HIGH_VELOCITY","AMMO_REPEATER_SPLIT_POINT"},
    ["-1101297303"] = {"AMMO_REVOLVER","AMMO_REVOLVER_EXPRESS","AMMO_REVOLVER_EXPRESS_EXPLOSIVE","AMMO_REVOLVER_HIGH_VELOCITY","AMMO_REVOLVER_SPLIT_POINT","AMMO_SHOTGUN","AMMO_SHOTGUN_BUCKSHOT_INCENDIARY","AMMO_SHOTGUN_EXPRESS_EXPLOSIVE","AMMO_SHOTGUN_SLUG"},
    ["970310034"] = {"AMMO_RIFLE","AMMO_RIFLE_ELEPHANT","AMMO_RIFLE_EXPRESS","AMMO_RIFLE_EXPRESS_EXPLOSIVE","AMMO_RIFLE_HIGH_VELOCITY","AMMO_RIFLE_SPLIT_POINT","AMMO_22","AMMO_22_TRANQUILIZER"},
    ["-1212426201"] = {"AMMO_RIFLE","AMMO_RIFLE_EXPRESS","AMMO_RIFLE_EXPRESS_EXPLOSIVE","AMMO_RIFLE_HIGH_VELOCITY","AMMO_RIFLE_SPLIT_POINT"},
    ["860033945"] = {"AMMO_SHOTGUN","AMMO_SHOTGUN_BUCKSHOT_INCENDIARY","AMMO_SHOTGUN_EXPRESS_EXPLOSIVE","AMMO_SHOTGUN_SLUG"},
    ["-1241684019"] = {"AMMO_ARROW","AMMO_ARROW_DYNAMITE","AMMO_ARROW_FIRE","AMMO_ARROW_IMPROVED","AMMO_ARROW_SMALL_GAME","AMMO_ARROW_POISON"},
    ["1548507267"] = {"AMMO_THROWING_KNIVES","AMMO_TOMAHAWK","AMMO_POISONBOTTLE","AMMO_BOLAS","AMMO_BOLAS_HAWKMOTH","AMMO_BOLAS_INTERTWINED","AMMO_BOLAS_IRONSPIKED","AMMO_DYNAMITE","AMMO_DYNAMITE_VOLATILE","AMMO_MOLOTOV","AMMO_MOLOTOV_VOLATILE"}
  },

  maxammo = { -- max ammo allowed to transfer between players
    AMMO_PISTOL = 100,
    AMMO_PISTOL_EXPRESS = 100,
    AMMO_PISTOL_EXPRESS_EXPLOSIVE = 100,
    AMMO_PISTOL_HIGH_VELOCITY = 100,
    AMMO_PISTOL_SPLIT_POINT = 100,
    AMMO_REPEATER = 100,
    AMMO_REPEATER_EXPRESS = 100,
    AMMO_REPEATER_EXPRESS_EXPLOSIVE = 100,
    AMMO_REPEATER_HIGH_VELOCITY = 100,
    AMMO_REPEATER_SPLIT_POINT = 100,
    AMMO_REVOLVER = 100,
    AMMO_REVOLVER_EXPRESS = 100,
    AMMO_REVOLVER_EXPRESS_EXPLOSIVE = 100,
    AMMO_REVOLVER_HIGH_VELOCITY = 100,
    AMMO_REVOLVER_SPLIT_POINT = 100,
    AMMO_RIFLE = 100,
    AMMO_RIFLE_ELEPHANT = 100,
    AMMO_RIFLE_EXPRESS = 100,
    AMMO_RIFLE_EXPRESS_EXPLOSIVE = 100,
    AMMO_RIFLE_HIGH_VELOCITY = 100,
    AMMO_RIFLE_SPLIT_POINT = 100,
    AMMO_22 = 100,
    AMMO_22_TRANQUILIZER = 100,
    AMMO_SHOTGUN = 100,
    AMMO_SHOTGUN_BUCKSHOT_INCENDIARY = 100,
    AMMO_SHOTGUN_EXPRESS_EXPLOSIVE = 100,
    AMMO_SHOTGUN_SLUG = 100,
    AMMO_ARROW = 10,
    AMMO_ARROW_DYNAMITE = 10,
    AMMO_ARROW_FIRE = 10,
    AMMO_ARROW_IMPROVED = 10,
    AMMO_ARROW_SMALL_GAME = 10,
    AMMO_ARROW_POISON = 10,
    AMMO_THROWING_KNIVES = 10,
    AMMO_TOMAHAWK = 10,
    AMMO_POISONBOTTLE = 10,
    AMMO_BOLAS = 10,
    AMMO_BOLAS_HAWKMOTH = 10,
    AMMO_BOLAS_INTERTWINED = 10,
    AMMO_BOLAS_IRONSPIKED = 10,
    AMMO_DYNAMITE = 5,
    AMMO_DYNAMITE_VOLATILE = 5,
    AMMO_MOLOTOV = 5,
    AMMO_MOLOTOV_VOLATILE = 5
  },
  Ammolabels = { -- you can change this to your language
    AMMO_PISTOL = "Normal Pistol",
    AMMO_PISTOL_EXPRESS = "Express Pistol",
    AMMO_PISTOL_EXPRESS_EXPLOSIVE = "Explosives Pistol",
    AMMO_PISTOL_HIGH_VELOCITY = "Velocity Pistol",
    AMMO_PISTOL_SPLIT_POINT = "Splitpoint Pistol",
    AMMO_REPEATER = "Normal Repeater",
    AMMO_REPEATER_EXPRESS = "Express Repeater",
    AMMO_REPEATER_EXPRESS_EXPLOSIVE = "Explosives Repeater",
    AMMO_REPEATER_HIGH_VELOCITY = "Velocity Repeater",
    AMMO_REPEATER_SPLIT_POINT = "Splitpoint Repeater",
    AMMO_REVOLVER = "Normal Revolver",
    AMMO_REVOLVER_EXPRESS = "Express Revolver",
    AMMO_REVOLVER_EXPRESS_EXPLOSIVE = "Explosives Revolver",
    AMMO_REVOLVER_HIGH_VELOCITY = "Velocity Revolver",
    AMMO_REVOLVER_SPLIT_POINT = "Splitpoint Revolver",
    AMMO_RIFLE = "Normal Rifle",
    AMMO_RIFLE_ELEPHANT = "Elephant Rifle",
    AMMO_RIFLE_EXPRESS = "Express Rifle",
    AMMO_RIFLE_EXPRESS_EXPLOSIVE = "Explosives Rifle",
    AMMO_RIFLE_HIGH_VELOCITY = "Velocity Rifle",
    AMMO_RIFLE_SPLIT_POINT = "Splitpoint Rifle",
    AMMO_22 = "22 Rifle",
    AMMO_22_TRANQUILIZER = "22 Tranquilizer Rifle",
    AMMO_SHOTGUN = "Normal Shotgun",
    AMMO_SHOTGUN_BUCKSHOT_INCENDIARY = "Incendiary Shotgun",
    AMMO_SHOTGUN_EXPRESS_EXPLOSIVE = "Explosive Shotgun",
    AMMO_SHOTGUN_SLUG = "Slug Shotgun",
    AMMO_ARROW = "Normal Arrows",
    AMMO_ARROW_DYNAMITE = "Dynamite Arrows",
    AMMO_ARROW_FIRE = "Fire Arrows",
    AMMO_ARROW_IMPROVED = "Improved Arrows",
    AMMO_ARROW_SMALL_GAME = "Small Game Arrows",
    AMMO_ARROW_POISON = "Poison Arrows",
    AMMO_THROWING_KNIVES = "Throwing Knives",
    AMMO_TOMAHAWK = "Tomahawk",
    AMMO_POISONBOTTLE = "Poison Bottle",
    AMMO_BOLAS = "Bolas",
    AMMO_BOLAS_HAWKMOTH = "Hawkmoth Bolas",
    AMMO_BOLAS_INTERTWINED = "Intertwined Bolas",
    AMMO_BOLAS_IRONSPIKED = "Ironspiked Bolas",
    AMMO_DYNAMITE = "Dynamite",
    AMMO_DYNAMITE_VOLATILE = 'Volatile Dynamite',
    AMMO_MOLOTOV = "Molotov",
    AMMO_MOLOTOV_VOLATILE = "Volatile Molotov"
  },
  
  --DON'T TOUCH BESIDES NAME OF WEAPON
  Weapons = {
    {
      Name     = "Lasso Fragile", -- TRANSLATE NAME ONLY
      Desc     = "Lasso relativement peux fiables, vos captures pourrait s'échapper", -- CHANGE DESCRIPTION ONLY
      HashName = "WEAPON_LASSO", -- DONT TOUCH
    },
    {
      Name     = "Lasso",
      Desc     = "Un lasso qui peut servir a plusieurs choses",
      HashName = "WEAPON_LASSO_REINFORCED",
    },
    {
      Name = "Couteau de chasse",
      Desc = "Couteau utilisé principalement pour dépecer les animaux",
      HashName = "WEAPON_MELEE_KNIFE",
    },
    {
      Name = "Couteau rustique",
      Desc = "Un vieux couteau, pourrait-il encore être utile ?",
      HashName = "WEAPON_MELEE_KNIFE_RUSTIC",
    },
    {
      Name = "Couteau de l'horreur",
      Desc = "Ce couteau a été utilisé pour faire plein de choses désagréables",
      HashName = "WEAPON_MELEE_KNIFE_HORROR",
    },
    {
      Name = "Couteau de la Guerre de Sécession",
      Desc = "Un couteau avec beaucoup d'histoire",
      HashName = "WEAPON_MELEE_KNIFE_CIVIL_WAR",
    },
    {
      Name = "Couteau en os",
      Desc = "Un couteau fait d'os anciens",
      HashName = "WEAPON_MELEE_KNIFE_JAWBONE",
    },
    {
      Name = "Couteau du mineur",
      Desc = "Meilleur amis du mineur",
      HashName = "WEAPON_MELEE_KNIFE_MINER",
    },
    {
      Name = "Couteau de vampire",
      Desc = "Ils ne peuvent pas être réels...",
      HashName = "WEAPON_MELEE_KNIFE_VAMPIRE",
    },
    {
      Name = "Couperet",
      Desc = "Aspect effrayant mais utile",
      HashName = "WEAPON_MELEE_CLEAVER",
    },
    {
      Name = "Hachette",
      Desc = "Un morceau de bois avec une lame",
      HashName = "WEAPON_MELEE_HATCHET",
    },
    {
      Name = "Hachette à double tranchant",
      Desc = "Un morceau de bois avec deux fois la lame",
      HashName = "WEAPON_MELEE_HATCHET_DOUBLE_BIT",
    },
    {
      Name = "Hachette à équarrir",
      Desc = "Certains disent que cette hachette est magique",
      HashName = "WEAPON_MELEE_HATCHET_HEWING",
    },
    {
      Name = "Hachette du chasseur",
      Desc = "Le meilleur amis des chasseurs",
      HashName = "WEAPON_MELEE_HATCHET_HUNTER",
    },
    {
      Name = "Hachette du Viking",
      Desc = "Odeurs de poisson et de sel",
      HashName = "WEAPON_MELEE_HATCHET_VIKING",
    },
    {
      Name = "Tomahawk",
      Desc = "Une arme digne d'un guerrier",
      HashName = "WEAPON_THROWN_TOMAHAWK",
    },
    {
      Name = "Tomahawk Ancien",
      Desc = "Celui-ci est ancien",
      HashName = "WEAPON_THROWN_TOMAHAWK_ANCIENT",
    },
    {
      Name = "Couteaux de lancer",
      Desc = "Les gens adorent jouer avec ces",
      HashName = "WEAPON_THROWN_THROWING_KNIVES",

    },
    {
      Name = "Machette",
      Desc = "Utile dans la jungle",
      HashName = "WEAPON_MELEE_MACHETE",
    },
    {
      Name = "Arc",
      Desc = "Une arme simple mais efficace",
      HashName = "WEAPON_BOW",
    },
    {
      Name = "Pistolet Semi-Automatique",
      Desc = "Arme de poing à chambre unique à répétition",
      HashName = 'WEAPON_PISTOL_SEMIAUTO',
    },
    {
      Name = "Pistolet Mauser",
      Desc = "Pistolet semi-automatique produit à l'origine par le fabricant d'armes allemand Mauser",
      HashName = "WEAPON_PISTOL_MAUSER",
    },
    {
      Name = "Pistolet Volcanic",
      Desc = "Une version améliorée des munitions Rocket Ball",
      HashName = "WEAPON_PISTOL_VOLCANIC",
    },
    {
      Name = "Pistolet M1899",
      Desc = "Ses munitions chargées en chargeur permettent un rechargement rapide",
      HashName = "WEAPON_PISTOL_M1899",
    },
    {
      Name = "Revolver Schofield",
      Desc = "Revolver à simple action à cartouche",
      HashName = "WEAPON_REVOLVER_SCHOFIELD",
    },
    {
      Name = "Revolver Navy",
      Desc = "revolver cap and ball conçu par Samuel Colt",
      HashName = "WEAPON_REVOLVER_NAVY",
    },
    {
      Name = "Revolver Navy Crossover",
      Desc = "revolver cap and ball conçu par Samuel Colt",
      HashName = "WEAPON_REVOLVER_NAVY_CROSSOVER",
    },
    {
      Name = "Revolver Lemat",
      Desc = "Un revolver qui est aussi un fusil de chasse",
      HashName = "WEAPON_REVOLVER_LEMAT",
    },
    {
      Name = "Revolver Double Action",
      Desc = "A une gâchette qui arme le marteau et le libère d'un seul coup ",
      HashName = "WEAPON_REVOLVER_DOUBLEACTION",
    },
    {
      Name = "Revolver Cattleman",
      Desc = "Le meilleur amis du cowboy",
      HashName = "WEAPON_REVOLVER_CATTLEMAN",
    },
    {
      Name = "Revolver Cattleman mexican",
      Desc = "Une autre saveur",
      HashName = "WEAPON_REVOLVER_CATTLEMAN_MEXICAN",
    },
    {
      Name = "Fusil à petit gibier",
      Desc = "Un fusil utile pour chasser les bestioles",
      HashName = "WEAPON_RIFLE_VARMINT",

    },
    {
      Name = "Carabine Winchester",
      Desc = "Fusils à répétition à levier fabriqués par la Winchester Repeating Arms Company",
      HashName = "WEAPON_REPEATER_WINCHESTER",

    },
    {
      Name = "Carabine Henry",
      Desc = "Carabine à chargeur tubulaire à levier",
      HashName = "WEAPON_REPEATER_HENRY",

    },
    {
      Name = "Carabine Evans",
      Desc = "Un fusil à répétition à levier conçu par Warren R. Evans comme un fusil de grande capacité",
      HashName = "WEAPON_REPEATER_EVANS",

    },
    {
      Name = "Carabine à répétition",
      Desc = "Un fusil à répétition fiable et populaire, le Buck Carbine fournit des dégâts moyens et une cadence de tir décente",
      HashName = "WEAPON_REPEATER_CARBINE",
    },
    {
      Name = "Fusil Rolling Block",
      Desc = "Remington Rolling Block est une famille de fusils à chargement par la culasse",
      HashName = "WEAPON_SNIPERRIFLE_ROLLINGBLOCK",
    },
    {
      Name = "Fusil Carcano",
      Desc = "Le Carcano est un fusil à verrou italien",
      HashName = "WEAPON_SNIPERRIFLE_CARCANO",
    },
    {
      Name = "Fusil Springfield",
      Desc = "Fusil standard de l'armée",
      HashName = "WEAPON_RIFLE_SPRINGFIELD",
    },
    {
      Name = "Fusil Elephant",
      Desc = "Meilleure arme pour un chasseur cherchant à abattre de grosses proies",
      HashName = "WEAPON_RIFLE_ELEPHANT",
    },
    {
      Name = "Fusil à verrou",
      Desc = "Mécanisme d'arme à feu manuel actionné en manipulant directement la culasse",
      HashName = "WEAPON_RIFLE_BOLTACTION",
    },
    {
      Name = "Fusil semi-automatique",
      Desc = "Un fusil à répétition à action semi-automatique, capable de chambrer automatiquement",
      HashName = "WEAPON_SHOTGUN_SEMIAUTO",
    },
    {
      Name = "Fusil à canon scié",
      Desc = "Fusil avec un canon plus court",
      HashName = "WEAPON_SHOTGUN_SAWEDOFF",
    },
    {
      Name = "Fusil à répétition",
      Desc = "Le fusil à répétition Lancaster",
      HashName = "WEAPON_SHOTGUN_REPEATING",
    },
    {
      Name = "Fusil à double canon exotique",
      Desc = "Variante de rareté exotique du fusil de chasse à double canon",
      HashName = "WEAPON_SHOTGUN_DOUBLEBARREL_EXOTIC",
    },
    {
      Name = "Fusil à pompe",
      Desc = "Répétition de l'action d'une arme à feu qui est actionnée manuellement en déplaçant un garde-main coulissant",
      HashName = "WEAPON_SHOTGUN_PUMP",

    },
    {
      Name = "Fusil à double cano",
      Desc = "Fusil à pompe à deux canons parallèles, permettant de tirer deux coups simples en succession rapide",
      HashName = "WEAPON_SHOTGUN_DOUBLEBARREL",
    },
    {
      Name = "Appareil photo",
      Desc = "Le meilleur amis du journaliste",
      HashName = "WEAPON_KIT_CAMERA",
    },
    {
      Name = "Jumelles améliorées",
      Desc = "Voir les choses clairement !",
      HashName = "WEAPON_KIT_BINOCULARS_IMPROVED",
    },
    {
      Name = "Couteau-lance",
      Desc = "Le meilleur ami des commerçants",
      HashName = "WEAPON_MELEE_KNIFE_TRADER",
    },
    {
      Name = "Jumelles",
      Desc = "Permet de voir de loin",
      HashName = "WEAPON_KIT_BINOCULARS",
    },
    {
      Name = "Appareil photo avancé",
      Desc = "Un appareil photo légèrement meilleur sur le plan technologique",
      HashName = "WEAPON_KIT_CAMERA_ADVANCED",
    },
    {
      Name = "Lanterne",
      Desc = "Permet de mieux voir dans le noir",
      HashName = "WEAPON_MELEE_LANTERN",
    },
    {
      Name = "Lanterne de Davy",
      Desc = "Lampe de sécurité destinée à être utilisée dans des atmosphères inflammables",
      HashName = "WEAPON_MELEE_DAVY_LANTERN",
    },
    {
      Name = "Lanterne d'Halloween",
      Desc = "Fait avec un vrai crâne humain",
      HashName = "WEAPON_MELEE_LANTERN_HALLOWEEN",
    },
    {
      Name = "Bouteille empoisonnée",
      Desc = "Qui sait ce qu'il y a dans ce truc",
      HashName = "WEAPON_THROWN_POISONBOTTLE",
    },
    {
      Name = "Détecteur de métaux",
      Desc = "Vous aide à trouver des objets de valeur",
      HashName = "WEAPON_KIT_METAL_DETECTOR",
    },
    {
      Name = "Dynamite",
      Desc = "Boom ?!",
      HashName = "WEAPON_THROWN_DYNAMITE",

    },
    {
      Name = "Molotov",
      Desc = "Le meilleur ami des pyromanes",
      HashName = "WEAPON_THROWN_MOLOTOV",

    },
    {
      Name = "Arc amélioré",
      Desc = "Un arc avec une meilleure précision",
      HashName = "WEAPON_BOW_IMPROVED",
    },
    {
      Name = "Machette Collector",
      Desc = "Chaque collectionneur en a besoin",
      HashName = "WEAPON_MELEE_MACHETE_COLLECTOR",
    },
    {
      Name = "Lanterne électrique",
      Desc = "Une merveille de technologie",
      HashName = "WEAPON_MELEE_LANTERN_ELECTRIC",
    },
    {
      Name = "Torche",
      Desc = "Un simple en feu",
      HashName = "WEAPON_MELEE_TORCH",
    },
    {
      Name = "Pichet de moonshine",
      Desc = "Un bon gros pichet",
      HashName = "WEAPON_MOONSHINEJUG_MP",

    },
    {
      Name = "Bolas",
      Desc = "Chaque dur à cuire en a besoin d'un",
      HashName = "WEAPON_THROWN_BOLAS",
    },
    {
      Name = "Bolas sphinx",
      Desc = "Des bolas sphinx",
      HashName = "WEAPON_THROWN_BOLAS_HAWKMOTH",
    },
    {
      Name = "Bolas à pointes de fer",
      Desc = "Un bola plus énervé",
      HashName = "WEAPON_THROWN_BOLAS_IRONSPIKED",

    },
    {
      Name = "Bolas entrelacés",
      Desc = "Un bola costaud",
      HashName = "WEAPON_THROWN_BOLAS_INTERTWINED",

    },
    {
      Name = "Canne à pêche",
      Desc = "Quoi de mieux que d'attraper du poisson",
      HashName = "WEAPON_FISHINGROD",
    },
    {
      Name = "Machette de l'horreur",
      Desc = "Celui-ci fait peur aux gens",
      HashName = "WEAPON_MACHETE_HORROR",
    },
    {
      Name = "Lanterne d'Halloween",
      Desc = "Fait avec un vrai crâne humain",
      HashName = "WEAPON_MELEE_LANTERN_HALOWEEN",

    },
    {
      Name = "Marteau",
      Desc = "Le gros marteau de ses morts",
      HashName = "WEAPON_MELEE_HAMMER",
    }
  }
}
