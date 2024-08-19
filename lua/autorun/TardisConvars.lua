-- PersonalTardis_Interior toyota_2017_F
-- PersonalTardis_Interior hurt

-- select tardis key interior via concommand
CreateClientConVar("tardis2_PersonalInterior", "Default")

-- select interior function
-- function TardisSelectInterior()
--     return GetConVar("tardis2_PersonalInterior"):GetString()  -- doing this through the key instead?
-- end

-- handles keybind for door open finger snap
concommand.Add("+TardisSnap", function(ply)
    TardisFingerSnap(ply)
end)

-- enables the new portal collision system
CreateConVar("TARDIS_NewStuckSystem", "1")

-- toggles disabling of cloister bells on active handbrake, on by default as per base addon
CreateClientConVar("hugoextension_tardis2_HandbrakeDisablesCloister", "1")

-- keeps lightbleed enabled at all times, even when power is on
CreateClientConVar("hugoextension_tardis2_Lightbleed_Alwayson", "0")


-- force-enables the new power system for ALL extensions across the board - not recommended!! it *will* look bad on most of them because they were made before this system existed!!
-- for optimal results, disable this convar and manually add a lowpower configuration to your extension of choice
CreateClientConVar("hugoextension_tardis2_NewPowerSystem", "0")

-- small setting intended for the clientside settings menu, toggles wether the tardis should automatically power on or stay dark after a repair
CreateClientConVar("hugoextension_tardis2_PowerUpAfterRepair", "1")

-- enables the projected light that attempts to light the interior doors the same way as the exterior doors
CreateClientConVar("hugoextension_tardis2_UniversalDoorlight", "1")
-- will be removed and replaced with extension specific metadata eventually

-- toggles moffat/rtd style exterior demat phase effect
CreateClientConVar("hugoextension_tardis2_PhaseEffect", "1")
-- todo: make this a per tardis setting like chameleon circuit or double doors

-- allow player to disable an extension's part timers if the extension is configured to allow disabling them -- THIS SETTING REQUIRES A LUA FILE RESTART
CreateClientConVar("hugoextension_tardis2_UsePartTimers", "1")                                               -- BECAUSE PARTS ARE ONLY INITIALIZED WHEN THE FILE IS EXECUTED
-- makes controls activate/respond instantly

-- allow the player to choose how many tries they want to dedicate to finding an interior; higher means more lag, but greater chance of finding one on smaller maps, so just let the player choose
CreateClientConVar("hugoextension_tardis2_IntPositionAttempts", "10000")


concommand.Add("hugoextension_tardis2_FlushCachedIntPos", function(ply)
    TardisFlushCachedIntpos(ply)
end)
