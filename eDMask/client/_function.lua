_Client = {} or {}
_Client.Function = {} or {}
_Client.Function.Locales = Traduction.Locales[eDMask.Utils.Language];

_Client.Function.Blips = function()
    for _, v in pairs(eDMask.Position) do
        local blip = AddBlipForCoord(v.pos)
        SetBlipSprite(blip, eDMask.Blips.Sprite)
        SetBlipColour(blip, eDMask.Blips.Color)
        SetBlipScale(blip, eDMask.Blips.Scale)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(eDMask.Blips.Name)
        EndTextCommandSetBlipName(blip)
    end
end

_Client.Function.NoSave = function()
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        eDMask.Utils.InSide('skinchanger:loadSkin', skin)
    end)
end

_Client.Function.Face = function()
    SetEntityInvincible(PlayerPedId(), true) 
    FreezeEntityPosition(PlayerPedId(), true) 									
    SetEntityCoords(PlayerPedId(), -1336.9627, -1277.15600, 4.5238-0.98, 0.0, 0.0, 0.0, 10)
    SetEntityHeading(PlayerPedId(), 80.9283561706543)				
    Citizen.Wait(1)
    cam = CreateCam("DEFAULT_SCRIPTED_Camera", 1)	
    SetCamCoord(cam, -1338.06, -1277.10, 5.6238, 0.0, 0.0, 200.455696105957, 15.0, false, 0)
    SetCamFov(cam, 50.0)
    RenderScriptCams(1000, 1000, 1000, 1000, 1000)
    PointCamAtCoord(cam, -1336.9627, -1277.15600, 5.6238)  
end

_Client.Function.DestoryCam = function()
    RenderScriptCams(false, false, 0, 1, 0)
    DestroyAllCams(false)
end

_Client.Function.FovCam = function()
    if (IsDisabledControlPressed(1, 15))  then
        SetCamFov(cam, GetCamFov(cam)+0.3)
    elseif (IsDisabledControlPressed(1, 14)) then
        SetCamFov(cam, GetCamFov(cam)-0.3)
    end
end

_Client.Function.ControlDisable = {20, 24, 27, 178, 177, 189, 190, 187, 188, 202, 239, 240, 201, 172, 173, 174, 175}
_Client.Function.OnRenderCam = function()
    DisableAllControlActions(0)
    for k, v in pairs(_Client.Function.ControlDisable) do
        EnableControlAction(0, v, true)
    end
    local Control1, Control2 = IsDisabledControlPressed(1, 44), IsDisabledControlPressed(1, 51)
    if Control1 or Control2 then
        local pPed = PlayerPedId()
        SetEntityHeading(pPed, Control1 and GetEntityHeading(pPed) - 2.0 or Control2 and GetEntityHeading(pPed) + 2.0)

        for k, v in pairs(GetActivePlayers()) do 
            if v ~= GetPlayerIndex() then 
                NetworkConcealPlayer(v, true, true) 
            end 
        end
    end
end
