-- known issues:
-- all currently active controls (physlock, cloak) still shut down when toggling into low power mode despite such still being usable
-- im convinced there was something else that i cant think of right now, just imagine 'problem here'


ENT:AddHook("HandbrakeToggled", "LowPowerMode", function(self, on)

    if not self:GetPower() then return end  -- only allow toggling when power is not already off
    if GetConVar("hugoextension_tardis2_NewPowerSystem"):GetBool() == false then return end  -- disable entire thing if the player chooses to

    self:SetData("lowpowermodeenable", (not on), true) -- deploying handbrake signals tardis to go into full shutdown upon power toggle, low power mode if otherwise

        -- if not on then  -- if handbrake isnt pulled
        --     self:SetData("lowpowermodeenable", true, true)  -- deploying handbrake signals tardis to go into full shutdown upon power toggle
        -- else
        --     self:SetData("lowpowermodeenable", false, true) -- no handbrake means using low power mode instead
        -- end
end)



ENT:AddHook("PowerToggled", "LowPowerMode", function(self, on)

    if on == false and self:GetData("lowpowermodeenable",true) then  -- enables all low power mode related features upon power toggle
        self:SetData("lowpowermode", true, true)                     -- this second enable might seem redundant given the hook above, but this is important for some texturesets and events
    else                                                             -- because if only the above hook is used, low power mode would return true/enabled at all times, not only when power is off
        self:SetData("lowpowermode", false, true)
    end

end)



function ENT:GetLowPowerMode()
    return self:GetData("lowpowermode",false)
end



function ENT:SetLowPowerMode(on)
    self:SetData("lowpowermode", on, true)
    return true
end



function ENT:ToggleLowPowerMode()
    local on = not self:GetLowPowerMode()
    return self:SetLowPowerMode(on)
end