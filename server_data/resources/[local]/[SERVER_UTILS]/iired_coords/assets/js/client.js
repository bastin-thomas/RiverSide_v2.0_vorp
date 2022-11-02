RegisterCommand("coordslua", () => {
    let pos = GetEntityCoords(PlayerPedId())
    SendNuiMessage(JSON.stringify({ "type": Config.type, pos: { x: pos[0], y: pos[1], z: pos[2] } }));
}, false);

RegisterCommand("coordsJSON", () => {
    let pos = GetEntityCoords(PlayerPedId())
    SendNuiMessage(JSON.stringify({ "type": Config.type1, pos: { x: pos[0], y: pos[1], z: pos[2] } }));
}, false);

RegisterCommand("coordsvector3", () => {
    let pos = GetEntityCoords(PlayerPedId())
    SendNuiMessage(JSON.stringify({ "type": Config.type2, pos: { x: pos[0], y: pos[1], z: pos[2] } }));
}, false);

RegisterCommand("coords1", () => {
    let pos = GetEntityCoords(PlayerPedId())
    SendNuiMessage(JSON.stringify({ "type": Config.type3, pos: { x: pos[0], y: pos[1], z: pos[2] } }));
}, false);

RegisterCommand("coordsblips", () => {
    let pos = GetEntityCoords(PlayerPedId())
    SendNuiMessage(JSON.stringify({ "type": Config.type4, pos: { x: pos[0], y: pos[1], z: pos[2] } }));
}, false);