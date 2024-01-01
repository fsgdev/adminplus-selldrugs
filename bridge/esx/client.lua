if GetResourceState('es_extended') ~= 'started' then return end

ESX = exports.es_extended:getSharedObject()

function GetPlayerData()
    return ESX.GetPlayerData()
end

function setInvBusy(boolean)
    LocalPlayer.state:set("invBusy", boolean, true)
end