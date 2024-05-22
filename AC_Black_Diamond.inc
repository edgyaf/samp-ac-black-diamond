// by edgy
#if defined _INC_ac_black_diamond
    #endinput
#endif
#define _INC_ac_black_diamond

#tryinclude <open.mp>

#if !defined _INC_open_mp
    #include <a_samp>
#endif

stock ACBD_ToggleConnectionMessage(bool:toggle)
{
    return SetSVarInt("ACBD_DisableConnectionMessage", !toggle);
}

forward OnOldVersionDetected(playerid);
forward OnImprovedDeagleDetected(playerid);
forward OnExtraWsDetected(playerid);
forward OnS0beitDetected(playerid);
forward OnSampfuncsDetected(playerid);
forward OnSprintHookDetected(playerid);
forward OnModsDetected(playerid);
forward OnBypassDetected(playerid);
forward OnSilentAimDetected(playerid);

public OnPlayerConnect(playerid)
{
    static bool:notified;

    if (!notified)
    {
        new const LOADED = GetSVarInt("AC-Black Diamond");

        if (!LOADED)
        {
            print("AC-Black Diamond is not loaded! Anticheat callbacks will not work");
        }

        notified = true;
    }

    #if defined ACBD_OnPlayerConnect
        return ACBD_OnPlayerConnect(playerid);
    #else
        return 1;
    #endif
}
#if defined _ALS_OnPlayerConnect
    #undef OnPlayerConnect
#else
    #define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect ACBD_OnPlayerConnect
#if defined ACBD_OnPlayerConnect
    forward ACBD_OnPlayerConnect(playerid);
#endif
