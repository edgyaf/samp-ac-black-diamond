#include <a_samp>
#include <AC_Black_Diamond>

new g_KickTimer[MAX_PLAYERS];
new g_BanTimer[MAX_PLAYERS];

main()
{
    
}

public OnGameModeInit()
{
    AddPlayerClass(0, 0.0, 0.0, 3.0, 0.0, WEAPON_DEAGLE, 9999, WEAPON_FIST, 0, WEAPON_FIST, 0);

    return 1;
}

// Called when the player uses an old version of the client not supported by anti-cheat. It is recommended to kick the player out and ask him to update his SA-MP version.
public OnOldVersionDetected(playerid)
{
    printf("Old version detected %d", playerid);
	SendClientMessage(playerid, 0xFF000000, "Update your SA-MP version and return to the server: www.sa-mp.mp");
	GameTextForPlayer(playerid, "~r~Old Version", 5000, 3);
	DelayedKick(playerid);
    return 1;
}

// Called when the player uses ImprovedDeagle, a cheat similar to auto cbug that allows very fast shooting.
public OnImprovedDeagleDetected(playerid)
{
    printf("ImprovedDeagle detected %d", playerid);
	SendClientMessage(playerid, 0xFF000000, "You're using cheats (ImprovedDeagle), get out!");
	GameTextForPlayer(playerid, "~r~You're using cheats, get out!", 5000, 3);
	DelayedKick(playerid);
    return 1;
}

// Called when the player uses ExtraWS, which blocks the restoration of the default camera after a shot is fired, and also adds infinite zoom to the sniper rifle.
public OnExtraWsDetected(playerid)
{
    printf("ExtraWS detected %d", playerid);
	SendClientMessage(playerid, 0xFF000000, "You're using cheats (ExtraWS), get out!");
	GameTextForPlayer(playerid, "~r~You're using cheats, get out!", 5000, 3);
	DelayedKick(playerid);
    return 1;
}

// Called when the player uses s0beit. It is recommended to block players who use this.
public OnS0beitDetected(playerid)
{
    printf("s0beit detected %d", playerid);
	SendClientMessage(playerid, 0xFF000000, "You're using cheats (s0beit), get out!");
	GameTextForPlayer(playerid, "~r~You're using cheats, get out!", 5000, 3);
	DelayedKick(playerid);
    return 1;
}

// Called when the player uses SAMPFUNCS, which is an API used by many cheats.
public OnSampfuncsDetected(playerid)
{
    printf("SAMPFUNCS detected %d", playerid);
	SendClientMessage(playerid, 0xFF000000, "You're using cheats (SAMPFUNCS), get out!");
	GameTextForPlayer(playerid, "~r~You're using cheats, get out!", 5000, 3);
	DelayedKick(playerid);
    return 1;
}

// Called when the player uses SprintHook, which allows the player to automatically run very fast.
public OnSprintHookDetected(playerid)
{
    printf("SprintHook detected %d", playerid);
	SendClientMessage(playerid, 0xFF000000, "You're using cheats (SprintHook), get out!");
	GameTextForPlayer(playerid, "~r~You're using cheats, get out!", 5000, 3);
	DelayedKick(playerid);
    return 1;
}

// Called when the player uses CLEO and derived modifications.
public OnModsDetected(playerid)
{
    printf("Mods detected %d", playerid);
	SendClientMessage(playerid, 0xFF000000, "You're using cheats (CLEO/Mod Loader), get out!");
	GameTextForPlayer(playerid, "~r~You're using cheats, get out!", 5000, 3);
	DelayedKick(playerid);
    return 1;
}

// Called when the player uses software that attempts to bypass the anti-cheat. It is recommended to block such a player.
public OnBypassDetected(playerid)
{
    printf("Bypass detected %d", playerid);
	SendClientMessage(playerid, 0xFF000000, "You're using cheats, get out!");
	GameTextForPlayer(playerid, "~r~You're using cheats, get out!", 5000, 3);
	DelayedBan(playerid);
    return 1;
}

// Called when the player uses Silent Aim. Very useful even for more advanced types of this cheat.
public OnSilentAimDetected(playerid)
{
    printf("Silent Aim detected %d", playerid);
	SendClientMessage(playerid, 0xFF000000, "You're using cheats (Silent Aim), get out!");
	GameTextForPlayer(playerid, "~r~You're using cheats, get out!", 5000, 3);
	DelayedKick(playerid);
    return 1;
}

forward DelayedKick_(playerid);
public DelayedKick_(playerid)
{
    g_KickTimer[playerid] = 0;
    return Kick(playerid);
}

DelayedKick(playerid)
{
    if (!g_KickTimer[playerid])
    {
        g_KickTimer[playerid] = SetTimerEx("DelayedKick_", 600, false, "i", playerid);
    }
    return 1;
}

forward DelayedBan_(playerid);
public DelayedBan_(playerid)
{
    g_BanTimer[playerid] = 0;
    return Ban(playerid);
}

DelayedBan(playerid)
{
    if (!g_BanTimer[playerid])
    {
        g_BanTimer[playerid] = SetTimerEx("DelayedBan_", 600, false, "i", playerid);
    }
    return 1;
}

public OnPlayerDisconnect(playerid)
{
    if (g_KickTimer[playerid])
    {
        KillTimer(g_KickTimer[playerid]);
        g_KickTimer[playerid] = 0;
    }
    if (g_BanTimer[playerid])
    {
        KillTimer(g_BanTimer[playerid]);
        g_BanTimer[playerid] = 0;
    }

    return 1;
}
