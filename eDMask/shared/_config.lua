eDMask = {
    Utils = {
        PrefixEvent = "eDMask",
        Price = 75,
        GetESX = "esx:getSharedObject",
        ServerSide = TriggerServerEvent,
        ClientSide = TriggerClientEvent,
        InSide = TriggerEvent,
        Language = "fr",  
        Kick = function(PlayerPed, Msg) 
            _Shared.Function.Kick(PlayerPed, Msg)
        end,
        ShowNotification = function(Msg)
            _Shared.Function.ShowNotification(Msg)
        end,
        ShowHelpNotification = function(Msg)
            _Shared.Function.ShowHelpNotification(Msg)
        end,
    },
    Position = {
        {pos = 	vector3(-1337.69, -1277.76, 4.84)},
    },
    Blips = {
        Name = "Mask",
        Sprite = 362,
        Color = 3,
        Scale = 0.8,
    },
} 
