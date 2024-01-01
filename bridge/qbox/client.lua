if GetResourceState('qbx_core') ~= 'started' then return end

function GetPlayerData()
    return QBX.PlayerData
end

function setInvBusy(boolean)
    LocalPlayer.state:set("invBusy", boolean, true)
end