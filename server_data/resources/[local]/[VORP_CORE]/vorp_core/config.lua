--=============================================================================--
--========================= VORP SHARED CONFIG ================================--


Config = {

    autoUpdateDB = true,
    PrintPlayerInfoOnLeave = false, -- print in server console information of players leaving
    PrintPlayerInfoOnEnter = false, -- print player info on server console when enter server
    --======================== STARTING POINT ===========================--

    initGold     = 0.0,
    initMoney    = 200.0,
    initRol      = 0.0,
    initXp       = 0,
    initJob      = "unemployed", -- leave it like this
    initJobGrade = 0, -- leave it like this
    initGroup    = "user", -- leave it like this

    Whitelist                = false, -- dont use
    AllowWhitelistAutoUpdate = false, -- dont use
    SavePlayersStatus        = false, -- save players health stamina inner and outter core to DB?

    maxHealth             = 4, -- 10 is FULL 0 IS EMPTY define max outer core for players
    maxStamina            = 4, -- 10 is FULL 0 IS EMPTY define max outer core for players
    PVP                   = true, -- Can players attack/hurt one another
    PVPToggle             = false, -- If true, players can set their own pvp state
    savePlayersTimer      = 5, -- this will tell the core in how many minutes should all players be saved to the database
    showplayerIDwhenfocus = true, -- set false will show steam name when focus on another player RMB
    disableAutoAIM        = true, -- if false players with controllers will have autoaim just like in rdr2
    SavePlayersHours      = false, -- if you want to save players played hours in DB, tx admin already have this

    --=========================== MULTICHAR ==============================--
    SaveSteamNameDB   = false, -- TRUE if you want save steamname on character DB when player drop (need to update SQL)
    UseCharPermission = false, --| if false it will let players create maxchars bellow
    MaxCharacters     = 1, --MAX ALLOWED TO BE CREATED [if UseCharPermission = true, SELECTED players(with command) can create MaxCharacters characters / if UseCharPermission = false, players can create MaxCharacters characters]

    --=========================== UI CORES ==================================--
    -- disable
    HideOnlyDEADEYE = true,
    HidePlayersCore = false,
    HideHorseCores = false,

    --=========================== WEBHOOKS ==================================--
    webhookColor = 16711680, --EMBED COLOR
    name         = "VORPLOGS", --NAME OF EMBED
    logo         = "https://via.placeholder.com/30x30", --HEAD LOGO
    footerLogo   = "https://via.placeholder.com/30x30", --FOOTER LOGO
    Avatar       = "https://via.placeholder.com/30x30", -- AVATAR LOGO


    -- delete what you dont want
    Logs = {
        SetgroupWebhook   = "https://discord.com/api/webhooks/1028602913259524167/C5SFJvxA6UJuiQl-wnqJRWksJVYBlOJcY-_U3dZQRjKVljzXpZZbNUCCQAR4HBYgKptg", --SETJOB
        SetjobWebhook     = "https://discord.com/api/webhooks/1028602913259524167/C5SFJvxA6UJuiQl-wnqJRWksJVYBlOJcY-_U3dZQRjKVljzXpZZbNUCCQAR4HBYgKptg", --SETGROUP
        AddmoneyWebhook   = "https://discord.com/api/webhooks/1028602913259524167/C5SFJvxA6UJuiQl-wnqJRWksJVYBlOJcY-_U3dZQRjKVljzXpZZbNUCCQAR4HBYgKptg", --ADDMONEY
        DelMoneyWebhook   = "https://discord.com/api/webhooks/1028602913259524167/C5SFJvxA6UJuiQl-wnqJRWksJVYBlOJcY-_U3dZQRjKVljzXpZZbNUCCQAR4HBYgKptg", --DELMONEY
        AddItemsWebhook   = "https://discord.com/api/webhooks/1028602913259524167/C5SFJvxA6UJuiQl-wnqJRWksJVYBlOJcY-_U3dZQRjKVljzXpZZbNUCCQAR4HBYgKptg", --ADDITEMS
        AddWeaponsWebhook = "https://discord.com/api/webhooks/1028602913259524167/C5SFJvxA6UJuiQl-wnqJRWksJVYBlOJcY-_U3dZQRjKVljzXpZZbNUCCQAR4HBYgKptg", --ADDWEAPONS
        DelWagonsWebhook  = "https://discord.com/api/webhooks/1028602913259524167/C5SFJvxA6UJuiQl-wnqJRWksJVYBlOJcY-_U3dZQRjKVljzXpZZbNUCCQAR4HBYgKptg", --DELWAGONS
        TpmWebhook        = "https://discord.com/api/webhooks/1028602913259524167/C5SFJvxA6UJuiQl-wnqJRWksJVYBlOJcY-_U3dZQRjKVljzXpZZbNUCCQAR4HBYgKptg", --TPM
        DelHorseWebhook   = "https://discord.com/api/webhooks/1028602913259524167/C5SFJvxA6UJuiQl-wnqJRWksJVYBlOJcY-_U3dZQRjKVljzXpZZbNUCCQAR4HBYgKptg", --DELHORSE
        HealPlayerWebhook = "https://discord.com/api/webhooks/1028602913259524167/C5SFJvxA6UJuiQl-wnqJRWksJVYBlOJcY-_U3dZQRjKVljzXpZZbNUCCQAR4HBYgKptg", --HEALPLAYER
        ReviveWebhook     = "https://discord.com/api/webhooks/1028602913259524167/C5SFJvxA6UJuiQl-wnqJRWksJVYBlOJcY-_U3dZQRjKVljzXpZZbNUCCQAR4HBYgKptg", --REVIVE
        WhitelistWebhook  = "https://discord.com/api/webhooks/1028602913259524167/C5SFJvxA6UJuiQl-wnqJRWksJVYBlOJcY-_U3dZQRjKVljzXpZZbNUCCQAR4HBYgKptg", --WHITELIST
        BanWarnWebhook    = "https://discord.com/api/webhooks/1028602913259524167/C5SFJvxA6UJuiQl-wnqJRWksJVYBlOJcY-_U3dZQRjKVljzXpZZbNUCCQAR4HBYgKptg", --BANS/WARNS
        NewPlayerWebhook  = "https://discord.com/api/webhooks/1028602913259524167/C5SFJvxA6UJuiQl-wnqJRWksJVYBlOJcY-_U3dZQRjKVljzXpZZbNUCCQAR4HBYgKptg", --NEWPLAYER
        CharPermWebhook   = "https://discord.com/api/webhooks/1028602913259524167/C5SFJvxA6UJuiQl-wnqJRWksJVYBlOJcY-_U3dZQRjKVljzXpZZbNUCCQAR4HBYgKptg", --CHARPERMS
        ChangeNameWebhook = "https://discord.com/api/webhooks/1028602913259524167/C5SFJvxA6UJuiQl-wnqJRWksJVYBlOJcY-_U3dZQRjKVljzXpZZbNUCCQAR4HBYgKptg", -- CHANGECHARNAMES
    },

    ------------------------------------------------------------------------------
    ------------------------- UI Configurations ----------------------------------
    HideUi         = true, -- Show or Hide the Overall UI
    HideGold       = true, --disables Gold UI for all
    HideMoney      = true, --disables Money UI for all
    HideLevel      = true, --disables Level UI for all
    HideID         = true, --disables ID UI for all
    HideTokens     = true, --disables Token UI for all
    HidePVP        = true, --disables PVP UI for all
    UIPosition     = 'BottomRight', -- Changes position of UI. Options: BottomRight, MiddleRight, TopRight, TopMiddle, BottomMiddle
    UILayout       = 'Row', -- Changes the layour of the UI. Options: Row, Column
    HideWithRader  = true, -- UI will hide whenever the radar(minimap) is hidden
    OpenAfterRader = false, -- UI will show whenever the radar(minimap) is showing again
    CloseOnDelay   = false, -- UI will automatically close after an amount of time
    CloseOnDelayMS = 10000, -- CloseOnDelays time in miliseconds, 10000 = 10seconds

    ------------------------------------------------------------------------------
    ------------------------- MAP Configurations ----------------------------------
    mapTypeOnFoot     = 0, -- 0 = Off(no radar), 1 = Regular 2 = Expanded  3 = Simple(compass), for on foot
    mapTypeOnMount    = 0, -- 0 = Off(no radar), 1 = Regular 2 = Expanded  3 = Simple(compass), for on horse
    enableTypeRadar   = true, --- if true the above will work, if false players can choose their radar type in the game settings.
    Loadinscreen      = true, --ENABLE LOADING SCREENS on spawn and while spawn dead
    LoadinScreenTimer = 5000, -- miliseconds

    -------------------------------------------------------------------------------
    ------------------------------- RESPAWN ---------------------------------------

    HealthOnRespawn = 200, --Player's health when respawned in hospital (MAX = 500)
    HealthOnResurrection = 100, --Player's health when resurrected (MAX = 500)
    RagdollOnResurrection = true, -- Enable or disable Ragdoll and revive effects when revived
    --CanBeDamagedToSpawn = false, -- The player can take damage while spawning
    HealthRecharge = { enable = false, multiplier = 0.37 }, -- enable or disable auto recharge of health outer core (real ped health), multiplier 1.0 is default
    StaminaRecharge = { enable = true, multiplier = 0.2 }, -- enable or disable auto recharge of stamina outer core, multiplier 1.0 is default
    RespawnTime = 10, --seconds
    RespawnKey = 0xDFF812F9, --[E] KEY
    RespawnKeyTime = 5000, -- Milliseconds it will take to press the button
    CombatLogDeath = true, -- people who combat log now spawn in dead rather than force spawned

    --sprite = true, --- enable text with sprite or disable
    -- spriteColor = { r = 100, g = 1, b = 1 }, -- sprite rgb color
    UseControlsCamera = true, -- if youset this to true players while dead  or being carried can move the camera using w a d s controls this is resource intensive leave to false
    UseDeathHandler = false, -- levae this to true if you dont know what you doing . this is to disable the death handling incase you have something custom

    Hospitals = {
        Valentine = {
            name = "Valentine",
            pos = vector4(-283.83, 806.4, 119.38, 321.76), -- use vorp admin to get vector4 x y z h
        },
        SaintDenis = {
            name = "Saint Denis",
            pos = vector4(2721.4562, -1446.0975, 46.2303, 321.76),

        },
        Armadillo = {
            name = "Armadillo",
            pos = vector4(-3742.5, -2600.9, -13.23, 321.76),

        },
        Blackwater = {
            name = "Black water",
            pos = vector4(-723.9527, -1242.8358, 44.7341, 321.76),

        },
        Rhodes = {
            name = "Rhodes",
            pos = vector4(1229.0, -1306.1, 76.9, 321.76),

        },
    },
    -----------------------------------------------------------------------------

    ActiveEagleEye = false,
    ActiveDeadEye = false,
    TimeZoneDifference = 1, -- Your time zone difference with UTC in winter time

    ----------------------------------------------------------------------------
    --------------------------- COMMAND PERMISSION -----------------------------
    SetUserDBadmin = true, -- should the command addGroup set admins on Users table? for characters table do set false
    SetBothDBadmin = true, -- if set true should the command addGroup set admins on both table!
    GroupAllowed = { "admin" }, -- add here groups
    -- dont change this unless you change them in sv_commands too
    Commands = { "addGroup", "addJob", "addItems", "addWeapons", "addMoney", "delMoney", "healplayer",
        "reviveplayer", "tpm", "delhorse", "delwagons", "banplayer", "wlplayer", "unwlplayer", "warn",
        "unban", "unwarn", "changeCharName" }, -- commands available

    --------------------------------------------------------------------------------------
    -----------------------------BUILT IN RICH PRESENCE DISCORD --------------------------
    maxplayers = 48, -- change to the number of players that can get in to your server
    appid = nil, -- Application ID (Replace this with you own)
    biglogo = "LOGOname", -- image assets name for the "large" icon.
    biglogodesc = " Redm Server Connect: ", -- text when hover over image
    smalllogo = "smallboy name", -- image assets name for the "small" icon.(OPTIONAL)
    smalllogodesc = "Join us for a good time", -- text when hover over image
    discordlink = "https://discord.gg/", -- discord link
    richpresencebutton = "Join Discord", --set button text for Rich Presence Button
    shownameandid = true, --show player steam name and id


    ---------------------------------------------------------------------------------------
    ------------------------------- TRANSLATE ---------------------------------------------
    Langs = {
        IsConnected        = "🚫 Un autre compte est déjà connecté (steam | rockstar)",
        NoSteam            = "🚫 Vous devez ouvrir Steam, Ouvrez Steam et relancer RedM",
        NoInWhitelist      = "🚫 Vous n'êtes pas WhiteList.",
        NoPermissions      = "Vous n'avez pas les droits d'effectuer cette Action",
        CheckingIdentifier = "Vérifier l'ID",
        LoadingUser        = "Chargement de l'utilisateur",
        BannedUser         = "Vous êtes banni jusqu'à ",
        DateTimeFormat     = "%d/%m/%y %H:%M:%S", -- Set wished DateTimeFormat for output in ban notification
        TimeZone           = " CET", -- Set your timezone
        DropReasonBanned   = "Vous avez été banni pour ",
        Warned             = "Vous avez reçus un avertissement",
        Unwarned           = "On vous a retiré votre avertissement",
        TitleOnDead        = "Do /alertdoctor in chat to request doctors aid",
        SubTitleOnDead     = "You can respawn in %s seconds",
        RespawnIn          = "You can respawn in ",
        SecondsMove        = " seconds",
        YouAreCarried      = "You are being carried by a person",
        VoiceRangeChanged  = "Voice chat range changed to %s meters",
        promptLabel        = "Réaparaitre", -- prompt label.
        prompt             = "Appuyez", -- prompt group label
        wayPoint           = "VORP: You need to set a waypoint first!",
        mustBeSeated       = "VORP: You must be in the driver's seat!",
        wagonInFront       = "VORP: You must be seated or near a wagon to delete it!",
        cantCarry          = "VORP: Can't carry more weapons!",
        Hold               = "HOLD ON!!",
        Load               = "You are loading in",
        Almost             = "Almost there...",
        Holddead           = "VOUS ETES MORT",
        Loaddead           = "Vous avez quitté le serveur en étant mort.",
        forcedrespawn      = "YOU WILL BE RESPAWNED",
        forced             = "Parce que vous avez quitté le serveur en étant mort. ",
        sit                = "Vous devez vous assoir.",
        NotifyChar         = "you must set your char height to 1.0 there will bugs if you dont.",
        NotifyCharSelect   = "Once you ~e~delete ~q~a character theres no going back!",
        PVPNotifyOn        = "PVP On ",
        PVPNotifyOff       = "PVP Off",
        AddChar            = "Added Multicharacter ",
        RemoveChar         = "Removed Multicharacter ",
        WrongHex           = "Hex not in DB or Wrong Hex",
        myjob              = "Votre Travail est: ~o~",
        mygrade            = " ~q~Grade: ~o~",
        charhours          = "Vous avez ~o~ h de jeu avec se personnage",
        playhours          = "Vous avez ~o~ h de jeu sur le serveur",
        message            = " ou " .. " /calldoctor",
        message2           = "Le temps est écoulé",
        message3           = "Vous devez attendre avant de pouvoir respawn",
        message4           = "ID ",
        message5           = "Vous vous réveillez, aller voir un médecin",
        message6           = "Respawn!!!"
    },
}
