ENT:AddHook("CanDemat", "MatHopRange", function(self)

    if self:GetMatHop() then

        local pos = self:GetDestinationPos(true)
        local curpos = self:GetPos()

        if pos:Distance( curpos ) > 2200 then  -- originally 1500

            self:ToggleMatHopFail()
            TARDIS:Message(self:GetCreator(), "Warning: MatHop range exceeded!")
        end

    end

end)

----------------------------------------------------------------------------------------------------------------------------------------------

ENT:AddHook("ShouldFailDemat", "mathopfail", function(self)

    if self:GetMatHopFail()  then

        self:ToggleMatHopFail()
        return true

    end

end)

----------------------------------------------------------------------------------------------------------------------------------------------

ENT:AddHook("DestinationChanged", "mathoprangewarning", function(self)

    if self:GetMatHop() then

        local pos = self:GetDestinationPos(true)
        local curpos = self:GetPos()

        if pos:Distance( curpos ) > 2200 then  -- originally 1500

    TARDIS:Message(self:GetCreator(), "Alert: Destination exceeds MatHop range!")

        end

    end

end)
