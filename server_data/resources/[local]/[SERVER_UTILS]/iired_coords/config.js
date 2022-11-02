const Config = {
    type: "lua",
    type1: "JSON",
    type2: "vector3",
    type3: "coord1",
    type4: "blipscoords"
}


// coord1  
// [x] =  {["x"] = {-5981.06640625, -3161.2158203125, -26.489498138427734},},

// vector3
// vector3(-5981.06640625, -3161.2158203125, -26.489498138427734)

// JSON
// {'x': -5981.05859375, 'y': -3161.3251953125, 'z': -26.480335235595703}

// lua
// { x = -5981.05859375, y = -3161.3251953125, z = -26.480335235595703 }

// blipscoords
//  [x] =  {                
//     ["Enable"] = true, --enable disable                
//     ["Blip_Enable"] = true, --This enable blip                
//     ["Blip_Type"] = 00000, --Blip type                
//     ["Blip_Name"] = "xxxxx",--Blip name                
//     ["Coords"] = { x= -305.8414306640625, y= 791.185302734375, z= 117.86531829833984 },--coords            
// },