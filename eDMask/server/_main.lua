ESX = nil

eDMask.Utils.InSide(eDMask.Utils.GetESX, function(obj) ESX = obj end)

RegisterNetEvent(("%s:buyMask"):format(eDMask.Utils.GetESX))
AddEventHandler(("%s:buyMask"):format(eDMask.Utils.GetESX), function(pos, price)
    local src = source 
    local xPlayer = ESX.GetPlayerFromId(src)

    if (not (pos ~= nil)) then
        eDMask.Utils.Kick(src, _Server.Function.Locales["cheatDetected"])
        return
    end
    if (not (price ~= nil)) then
        eDMask.Utils.Kick(src, _Server.Function.Locales["cheatDetected"])
        return
    end
    if (_Server.Function.getPos(pos)) then
        if (xPlayer.getMoney() >= price) then
            xPlayer.removeMoney(price)
            TriggerClientEvent(("%s:buyMask"):format(eDMask.Utils.PrefixEvent), src)
            TriggerClientEvent(("%s:showNotification"):format(eDMask.Utils.PrefixEvent), src, _Server.Function.Locales["buyMask"])
        else
            TriggerClientEvent(("%s:notMoney"):format(eDMask.Utils.PrefixEvent), src)
            TriggerClientEvent(("%s:showNotification"):format(eDMask.Utils.PrefixEvent), src, _Server.Function.Locales["notEnoughMoney"])
        end 
    else
        eDMask.Utils.Kick(src, _Server.Function.Locales["cheatDetected"])
        return
    end
end)


