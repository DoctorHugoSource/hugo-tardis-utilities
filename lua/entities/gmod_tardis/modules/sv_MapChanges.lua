ENT:AddHook("StopDemat", "TardisMapChanges", function(self)

    -- handle level changes
    if self:GetMapTravel() then

        timer.Simple(3, function()

            if self:GetMapTravel() and self:GetData("vortex") == true then   -- final backup check

                if IsValid(jazztardis) then
                jazztardis:SaveStats()


                local targetmap = self:GetTargetMap()


                    local ply = jazztardis:GetCreator()

                    if IsValid(self.interior) then

                        local intang = jazztardis.interior:WorldToLocalAngles(ply:EyeAngles())
                        local intangstr = tostring(intang)

                        local intpos = jazztardis.interior:WorldToLocal(ply:GetPos())
                        local intposstr = tostring(intpos)

                            file.Write ("tardis_stats_plyposition.txt", intposstr )
                            file.Write ("tardis_stats_plyangle.txt", intangstr )
                            file.Write ("tardis_stats_maptransited.txt", "true" )

                    end

                    if targetmap == nil then
                    TARDIS:Message(ply, "ERROR: No Map Destination Detected! Aborting Map Travel!")
                    else
                    file.Write ("tardis_stats_maptransited.txt", "true" )
                    RunConsoleCommand("changelevel", targetmap)
                    end
                end
            end
        end)
    end

end)
