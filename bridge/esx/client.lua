if GetResourceState('es_extended') ~= 'started' then return end

invBusy = LocalPlayer.state.invBusy
ESX = exports.es_extended:getSharedObject()

function GetPlayerData()
    return ESX.GetPlayerData()
end