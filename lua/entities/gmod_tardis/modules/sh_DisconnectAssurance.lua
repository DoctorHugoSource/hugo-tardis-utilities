-- this file makes sure to spawn inside the tardis on next mapload if the player disconnects while inside it
-- also regularly saves tardis stats because i dont want to do that in a think hook

ENT:AddHook("PlayerEnter", "TardisDisconnectAssurancept1", function(self, ply)

    timer.Simple(0.3, function()

    file.Write ("tardis_stats_maptransited.txt", "true" )

    if IsValid(jazztardis) then
    jazztardis:SaveStats()
    end
end)
end)

----------------------------------------------------------------------------------------------------------------------------------------------

ENT:AddHook("PlayerExit", "TardisDisconnectAssurancept2", function(self, ply)

    timer.Simple(0.3, function()

    file.Write ("tardis_stats_maptransited.txt", "false" )

    if IsValid(jazztardis) then
    jazztardis:SaveStats()
    end
end)
end)




hook.Add("ShutDown", "TardisDisconnectAssurancept3", function()      -- save position in tardis upon disconnect

    if IsValid(jazztardis) then

        if not IsValid(jazztardis.interior) then return end

        local ply = jazztardis:GetCreator()

            local intang = jazztardis.interior:WorldToLocalAngles(ply:EyeAngles())
            local intangstr = tostring(intang)

            local intpos = jazztardis.interior:WorldToLocal(ply:GetPos())
            local intposstr = tostring(intpos)

                file.Write ("tardis_stats_plyposition.txt", intposstr )
                file.Write ("tardis_stats_plyangle.txt", intangstr )

    end
end)














