----------------------------------------------------------------------------
------------           VORP SHARED CONFIG                       ------------
----------------------------------------------------------------------------

Config = {
  ----------------------------------------------------------------------------
  ----------------------- SERVER MANAGEMENT -------------------------------------
  autoUpdateDB = false,

  ----------------------------------------------------------------------------
  ----------------------- STARTING POINT -------------------------------------
  initGold                 = 0.0,
  initMoney                = 10.0,
  initRol                  = 0.0,
  initXp                   = 0,
  initJob                  = "unemployed", -- leave it like this
  initJobGrade             = 0, -- leave it like this
  initGroup                = "user", -- leave it like this
  Whitelist                = false,
  AllowWhitelistAutoUpdate = false,
  maxHealth                = 4, -- 10 is FULL 0 IS EMPTY define max outer core for players
  maxStamina               = 4, -- 10 is FULL 0 IS EMPTY define max outer core for players
  PVP                      = true, -- Can players attack/hurt one another
  PVPToggle                = false, -- If true, players can set their own pvp state
  savePlayersTimer         = 10000, -- this will tell the core in how many miliseconds should all players be saved to the database, decreasing may reduce performance
  showplayerIDwhenfocus    = true, -- set false will show steam name when focus on another player RMB
  disableAutoAIM           = true, -- if false players with controllers will have autoaim just like in rdr2
  ------------------------------------------------------------------------------
  --------------------------- MULTICHARACTER -----------------------------------
  SaveSteamNameDB          = false, -- TRUE if you want save steamname on character DB when player drop (need to update SQL)
  UseCharPermission        = false, --(do not use this right now) TRUE if you want give multicharacter on selected players (need to update SQL) | if you change TRUE to FALSE player logs with first character created
  MaxCharacters            = 1, --MAX ALLOWED TO BE CREATED [if UseCharPermission = true, SELECTED players(with command) can create MaxCharacters characters / if UseCharPermission = false, players can create MaxCharacters characters]

  ------------------------------------------------------------------------------
  ------------------------------ UI CORES --------------------------------------
  HideOnlyDEADEYE = true,
  HidePlayersCore = false,
  HideHorseCores = false,

  ------------------------------------------------------------------------------
  ------------------------------ WEBHOOKS --------------------------------------


  webhookColor = 16711680, --EMBED COLOR
  name         = "VORPLOGS", --NAME OF EMBED
  logo         = "https://via.placeholder.com/30x30", --HEAD LOGO
  footerLogo   = "https://via.placeholder.com/30x30", --FOOTER LOGO
  Avatar       = "https://via.placeholder.com/30x30", -- AVATAR LOGO


  ---------------------------- WEBHOOK FOR EACH LOG -----------------------------
  --CHANGE THE LINKS
  -- delete what you dont want or add nil
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
    NewPlayerWebhook  = "", --NEWPLAYER
    CharPermWebhook   = "https://discord.com/api/webhooks/1028602913259524167/C5SFJvxA6UJuiQl-wnqJRWksJVYBlOJcY-_U3dZQRjKVljzXpZZbNUCCQAR4HBYgKptg", --CHARPERMS
  },

  ------------------------------------------------------------------------------
  ---------------------------- VOICE -------------------------------------------
  ActiveVoiceChat   = false,
  KeySwapVoiceRange = 0x80F28E95, --[L] KEY
  DefaultVoiceRange = 5.0,
  VoiceRanges       = { 2.0, 5.0, 12.0 },

  ------------------------------------------------------------------------------
  ------------------------- SHOW OR HIDE UI's ----------------------------------

  HideUi            = true, --show or hide the UI includes  gold cash ID and level bar  the cash gold ID are now being displayed in the inventory. you can disable this one if yo u like it more
  mapTypeOnFoot     = 0, -- 0 = Off(no radar), 1 = Regular 2 = Expanded  3 = Simple(compass), for on foot
  mapTypeOnMount    = 0, -- 0 = Off(no radar), 1 = Regular 2 = Expanded  3 = Simple(compass), for on horse
  enableTypeRadar   = true, --- if true the above will work, if false players can choose their radar type in the game settings.
  Loadinscreen      = true, --ENABLE LOADING SCREENS on spawn and while spawn dead
  LoadinScreenTimer = 10000, -- miliseconds
  -------------------------------------------------------------------------------
  ------------------------------- RESPAWN ---------------------------------------

  HealthOnRespawn = 200, --Player's health when respawned in hospital (MAX = 500)
  HealthOnResurrection = 100, --Player's health when resurrected (MAX = 500)
  DisableRecharge = true, --Disable auto recharge of health outer core (real ped health)
  RespawnTime = 10, --seconds
  RespawnKey = 0xDFF812F9, --[E] KEY
  RespawnTitleFont = 1, -- for the draw text message
  RespawnSubTitleFont = 1, -- for the draw text message sub title font
  CombatLogDeath = true, -- people who combat log now spawn in dead rather than force spawned
  ShowUiDeath = false, -- show or hide the UI if player is dead
  camDeath = true, -- enable or disable the camera death function
  sprite = true, --- enable text with sprite or disable
  spriteGrey = false, -- if set to false will enable RED sprite true will be grey

  hospital = {
    Armadillo = {
      name = "Armadillo",
      x = -3742.5,
      y = -2600.9,
      z = -13.23,
      h = 321.76
    },
    bw = {
      name = "bw",
      x = -723.9527,
      y = -1242.8358,
      z = 44.7341,
      h = 321.76
    },
  },
  -----------------------------------------------------------------------------
  HeadId = false,
  HeadIdDistance = 15,
  ModeKey = true,
  KeyShowIds = "0x8CC9CD42", -- Press X
  ActiveEagleEye = false,
  ActiveDeadEye = false,
  TimeZoneDifference = 1, -- Your time zone difference with UTC in winter time

  ----------------------------------------------------------------------------
  --------------------------- COMMAND PERMISSION -----------------------------
  Group = {
    Admin = "admin", --- group for all commands
    Mod = "moderator", --- second group for all commands

  },

  --------------------------------------------------------------------------------------
  -----------------------------BUILT IN RICH PRESENCE DISCORD --------------------------
  maxplayers = 48, -- change to the number of players that can get in to your server
  appid = nil, -- Application ID (Replace this with you own)
  biglogo = "synred", -- image assets name for the "large" icon.
  biglogodesc = " Redm Server Connect: ", -- text when hover over image
  smalllogo = "smallboy", -- image assets name for the "small" icon.(OPTIONAL)
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
    playhours          = "Vous avez ~o~ h de jeu sur le serveur"
  },
}
