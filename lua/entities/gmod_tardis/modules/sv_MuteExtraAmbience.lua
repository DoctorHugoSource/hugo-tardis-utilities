ENT:AddHook("PlayerEnter", "TardisMuteMapAmbience", function(ply)

TardisMuteExtraAmbience = true

    if SERVER then
--           ply:ConCommand( "playsoundscape nothing" )   -- try fixing this later
--             RunConsoleCommand("playsoundscape", "nothing")    -- not player specific, only a workaround

    end
end)

ENT:AddHook("PlayerExit", "TardisRestoreMapAmbience", function(ply)

TardisMuteExtraAmbience = false

    if SERVER then
--           ply:ConCommand( "soundscape_flush" )
--             RunConsoleCommand("soundscape_flush")    -- not player specific, only a workaround

    end
end)
