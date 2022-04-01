ESX = nil
_Client.Marcker = {} or {}
_Client.Marcker.Zone = true

Citizen.CreateThread(function()
    while (ESX == nil) do
        TriggerEvent(eDMask.Utils.GetESX, function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
    _Client.Marcker.Load()
    _Client.Function.Blips()
end)

_Client.Marcker.Load = function()
    _Client.Marcker.Zone = true
    Citizen.CreateThread(function()
        while (_Client.Marcker.Zone) do
            local InZone = false
            local playerPos = GetEntityCoords(PlayerPedId())
            for _, v in pairs(eDMask.Position) do
                local dst1 = GetDistanceBetweenCoords(playerPos, v.pos, true)
                    if (dst1 < 4.0) then
                    InZone = true
                    DrawMarker(20, v.pos, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 0, 180, 0, 255, true, true, p19, true) 
                    if (dst1 < 2.0) then
                        eDMask.Utils.ShowHelpNotification(_Client.Function.Locales["showhelpnotification"]) 
                        if IsControlJustReleased(1, 38) then
                            FreezeEntityPosition(PlayerPedId(), true)
                            _Client.Function.Face()
                            _Client.MainMenu.Open(v)
                        end
                    end
                end
            end
            if (not InZone) then
                Wait(500)
            else
                Wait(1)
            end
        end
    end)
    print(("%s ^5Create^7 by ^1eDen"):format(GetCurrentResourceName()))
end
