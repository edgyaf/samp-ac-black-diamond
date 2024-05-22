# AC Black Diamond

Anti-cheat for SA-MP supporting the latest versions.

> [!NOTE]
> This anti-cheat requires the player to use client version 0.3.7-R2 or later. R1 (and therefore also mobile clients) is not supported. It is recommended to block connections from this version and encourage players to update their client.

Anti-cheat improved by me. Due to the nature of the detection methods used, the main file is released only as AMX. If you have any doubts about its contents, analyze it with any HEX editor or ask your questions in the Issues section.

# How to use

1. Upload `AC_Black_Diamond.amx` to your `filterscripts` directory.
2. Add it to `server.cfg` or `config.json`.
3. Include `AC_Black_Diamond` in your gamemode or any script where you want to use the provided API.

Check `test.pwn` for a full example of usage.

# API

## Functions

```pawn
ACBD_ToggleConnectionMessage(bool:toggle);
```

Allows you to toggle the display of a message indicating the use of anti-cheat when entering the server. We do not force you to display it, but we would appreciate it if you leave it on.

## Callbacks

```pawn
public OnOldVersionDetected(playerid)
```

Called when the player uses an old version of the client not supported by anti-cheat. It is recommended to kick the player out and ask him to update his SA-MP version.

```pawn
public OnImprovedDeagleDetected(playerid)
```

Called when the player uses ImprovedDeagle, a cheat similar to auto cbug that allows very fast shooting.

```pawn
public OnExtraWsDetected(playerid)
```

Called when the player uses ExtraWS, which blocks the restoration of the default camera after a shot is fired, and also adds infinite zoom to the sniper rifle.

```pawn
public OnS0beitDetected(playerid)
```

Called when the player uses s0beit. It is recommended to block players who use this.

```pawn
public OnSampfuncsDetected(playerid)
```

Called when the player uses SAMPFUNCS, which is an API used by many cheats.

```pawn
public OnSprintHookDetected(playerid)
```

Called when the player uses SprintHook, which allows the player to automatically run very fast.

```pawn
public OnModsDetected(playerid)
```

Called when the player uses CLEO and derived modifications.

```pawn
public OnBypassDetected(playerid)
```

Called when the player uses software that attempts to bypass the anti-cheat. It is recommended to block such a player.

```pawn
public OnSilentAimDetected(playerid)
```

Called when the player uses Silent Aim. Very useful even for more advanced types of this cheat.
