if GetResourceState('qb-core') ~= 'started' then return end

invBusy = LocalPlayer.state.inv_busy
QBCore = exports['qb-core']:GetCoreObject()

function GetPlayerData()
    return QBCore.Functions.GetPlayerData()
end