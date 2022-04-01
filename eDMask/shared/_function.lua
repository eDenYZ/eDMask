_Shared = {} or {}
_Shared.Function = {} or {}

_Shared.Function.ShowNotification = function(Msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(Msg)
    DrawNotification(false, false)
end

_Shared.Function.ShowHelpNotification = function(Msg)
    AddTextEntry('HelpNotification', Msg)
    DisplayHelpTextThisFrame('HelpNotification', false)
end

_Shared.Function.Kick = function(PlayerPed, Msg)
    DropPlayer(PlayerPed, Msg)
end