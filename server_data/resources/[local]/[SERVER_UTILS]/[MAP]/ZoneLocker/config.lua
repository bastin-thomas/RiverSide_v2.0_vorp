
--TimeBeforeKill
TimeBeforeKill = 20 --in sec
MessageBeforeKill = "Vous quittez les terres connues, vous allez vous perdre dans 20 secondes (Mort)." -- You have Enter the DeadZone
MessageReturnSafe = "Ouf, vous avez retrouvé votre chemin vers les terres connues." -- You have quit the DeadZone

--Area, for add new one, copy one Row
Zones = {
    {
        --Zone Rhodes
        CoordCenter = vector3(1590.32, -1859.21, 52.35),    -- center
        CoordBorder = vector3(2116.52, -996.096, 41.73),     -- Border of the Circle
    },
    {
        --Zone SD1
        CoordCenter = vector3(2359.55, -681.13, 42.33),     -- center
        CoordBorder = vector3(2158.44, -956.54, 42.69),      -- Border of the Circle
    },
    {
        --Zone SD2 + VanHorn
        CoordCenter = vector3(3813.37, 91.33, 56.28),     -- center
        CoordBorder = vector3(2525.78, 261.19, 68.64),     -- Border of the Circle
    },
    {
        --Zone Annesburg
        CoordCenter = vector3(3199.56, 1213.42, 41.65),     -- center
        CoordBorder = vector3(2538.58, 1486.99, 85.84),     -- Border of the Circle
    },
    {
        --Zone ButcherCreek
        CoordCenter = vector3(2689.75, 716.48, 77.03),     -- center
        CoordBorder = vector3(2423.093017578125, 801.9408569335938, 90.92095184326172), -- Border of the Circle
    },
    {
        --Zone Vieux Forts
        CoordCenter = vector3(2446.4296875, 267.3923034667969, 69),
        CoordBorder = vector3(2447.4296875, 362.2590637207031, 59)
    },
    {
        --Zone Entre SD et VH
        CoordCenter = vector3(2676.00341796875, -302.8248596191406, 45.57963562011719),
        CoordBorder = vector3(2378.929931640625, -79.48323059082031, 45.599609375)
    },
    {
        --Bayout
        CoordCenter = vector3(2100.18212890625, -498.6644592285156, 38.72214889526367),
        CoordBorder = vector3(2014.8953857421875, -306.9102478027344, 41.739986419677734)
    },
    {
        --Bayout2
        CoordCenter = vector3(1896.54443359375, -964.98486328125, 44),
        CoordBorder = vector3(1583.727783203125, -861.3733520507812, 42)
    }
}