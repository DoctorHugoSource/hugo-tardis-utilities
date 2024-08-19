
ENT:AddHook("PartUsed", "HugoTardisUtilControls", function(self, part, ply)  -- legacy controls, from when the addon first started
                                                                             -- now also used as fallback controls for when a console doesn't have enough physical buttons for these

----------------------------------------------------------------------------------------------------------------------------------------------

if part.Control == "physlock" then  -- set to return to bar samsara

    if self.metadata.Interior.Travelcontrols ~= true then

        if self:GetPower() == false then return end

        if self.exterior:GetMapTravel() then

            if self.exterior:GetTargetMap() == "jazz_bar" then
            self.exterior:SetTargetMap(nil)
            TARDIS:Message(ply, "Target Map set to none")
            else
            local map = "jazz_bar"
            self.exterior:SetTargetMap(map)
            TARDIS:Message(ply, "Target Map set to ".. tostring(map))
            end

        end

    end

end

----------------------------------------------------------------------------------------------------------------------------------------------

if part.Control == "doorlock" then  -- enable map travel as a whole

    if self.metadata.Interior.Travelcontrols ~= true then

        if self:GetPower() == false then return end

        self.exterior:ToggleMapTravel()

        if self.exterior:GetMapTravel() == true then
        TARDIS:Message(ply, "Map Travel enabled")
        else
        TARDIS:Message(ply, "Map Travel disabled")
        end

    end

end

----------------------------------------------------------------------------------------------------------------------------------------------

if part.Control == "hads" then  -- whatever map the player chooses, to be refined later

    if self.metadata.Interior.Travelcontrols ~= true then

        if self:GetPower() == false then return end

        if self.exterior:GetMapTravel() then

            if self.exterior:GetTargetMap() == "gm_construct" then
            self.exterior:SetTargetMap(nil)
            TARDIS:Message(ply, "Target Map set to none")
            else
            local map = "gm_construct"
            self.exterior:SetTargetMap(map)
            TARDIS:Message(ply, "Target Map set to ".. tostring(map))
            end

        end

    end
end

----------------------------------------------------------------------------------------------------------------------------------------------

if part.Control == "engine_release" then  -- random maps for the jazztronauts map browser

    if self.metadata.Interior.Travelcontrols ~= true then

        if self:GetPower() == false then return end

        if self.exterior:GetMapTravel() then

            if self.exterior:GetTargetMap() == GlobalJazzTardisMap then
            self.exterior:SetTargetMap(nil)
            TARDIS:Message(ply, "Target Map set to none")
            else
            local map = GlobalJazzTardisMap
            self.exterior:SetTargetMap(map)
            TARDIS:Message(ply, "Target Map set to ".. tostring(map))
            end

        end

    end
end

----------------------------------------------------------------------------------------------------------------------------------------------

if part.Control == "engine_release" then  -- toggles mathop

    if self:GetPower() == false then return end
    if self:GetData("teleport",false) or self:GetData("vortex",false) then
        TARDIS:Message(self:GetCreator(), "Failed to toggle MatHop")
    return end

    if self.exterior:GetFastRemat() then

        self.exterior:ToggleMatHop()

        if self.exterior:GetMatHop() then
        TARDIS:Message(self:GetCreator(), "MatHop enabled")
        else
        TARDIS:Message(self:GetCreator(), "MatHop Disabled")
        end

    end

end

----------------------------------------------------------------------------------------------------------------------------------------------

if part.Control == "isomorphic" then  -- sensitive hads

    if self:GetPower() == false then return end

        self.exterior:ToggleSensitiveHADS()

        if self.exterior:GetSensitiveHADS() then
        TARDIS:Message(self:GetCreator(), "HADS sensitivity set to high!")
        else
        TARDIS:Message(self:GetCreator(), "HADS sensitivity set to default!")
        end

end



end)








--  self.exterior:SetData("vortexalpha",255)

----------------------------------------------------------------------------------------------------------------------------------------------

-- shortened version but has less modularity
-- function ENT:ToggleMatHop()
--
--     if not self:GetData("mathop",false) then
--         self:SetData("mathop",true,true)
--         else
--             self:SetData("mathop",false,true)
--     end
-- end





