if SERVER then return end

ENT:AddHook("Initialize", "PropLOData", function(self)  -- update color values

    local power = self:GetPower()
    local lowpower = self:GetLowPowerMode()

        local Lo = self.metadata.Interior.LightOverride
        local lovm = (power and Lo.basebrightness) or lowpower and Lo.lowpowerbrightness or Lo.nopowerbrightness

    local vmlocol = lovm + Lo.viewmodeladd

    self.vmlocolprop = vmlocol

end)



ENT:AddHook("PowerToggled", "PropLODataUpdate", function(self, on)

    local power = self:GetPower()
    local lowpower = self:GetLowPowerMode()

        local Lo = self.metadata.Interior.LightOverride
        local lovm = (power and Lo.basebrightness) or lowpower and Lo.lowpowerbrightness or Lo.nopowerbrightness

    local mult = Lo.viewmodeladd

    if on == false then
    mult = 0
    end

    local vmlocol = lovm + mult

    self.vmlocolprop = vmlocol

end)



ENT:AddHook("PlayerEnter", "TardisEnableViewmodelLO", function(self)  -- update color values

    local power = self:GetPower()
    local lowpower = self:GetLowPowerMode()

        local Lo = self.metadata.Interior.LightOverride
        local lovm = (power and Lo.basebrightness) or lowpower and Lo.lowpowerbrightness or Lo.nopowerbrightness

        local mult = Lo.viewmodeladd

        if power == false then
        mult = 0
        end

        local vmlocol = lovm + mult

        LocalPlayer():SetTardisData("vmlocol", vmlocol, true)  -- send it to the player
        self.vmlocol = vmlocol  -- send to client but not using tardis data, because that is wiped when you walk out
print (vmlocol)
end)



    ENT:AddHook("ThirdPerson", "vmlorestore", function(self, ply, enabled)  -- used to re-enable when leaving thirdperson

    if enabled == false then

        timer.Simple(0.01, function() -- necessary for the VM light override to update for some reason
        ply:SetTardisData("vmlocoldisable", false, true)
        end)

    end

    end)

----------------------------------------------------------------------------------------------------------------------------------------------

-- ENT:AddHook("PlayerExit", "TardisDisableViewmodelLO", function(self, ply)
--
--         TardisViewmodelLightingOverrideBool = false
--
-- end)

----------------------------------------------------------------------------------------------------------------------------------------------

ENT:AddHook("PowerToggled", "TardisUpdateViewmodelLO", function(self, on)

    local power = self:GetPower()
    local lowpower = self:GetLowPowerMode()

        local Lo = self.metadata.Interior.LightOverride
        local lovm = (power and Lo.basebrightness) or lowpower and Lo.lowpowerbrightness or Lo.nopowerbrightness

        local mult = Lo.viewmodeladd  -- technically not a multiplier because it directly adds a number but shut

        if on == false then
        mult = 0
        end

        local vmlocol = lovm + mult

        LocalPlayer():SetTardisData("vmlocol", vmlocol, true)
        self.vmlocol = vmlocol
print (vmlocol)
end)















