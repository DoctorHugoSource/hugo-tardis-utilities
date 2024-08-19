ENT:AddHook("OnHealthChange", "SensitiveHADS", function(self, newhealth, oldhealth)

if not self:GetSensitiveHADS() then return end

    if newhealth < oldhealth then
        if self:GetHADS() then
            self:TriggerHADS()
        end
    end
end)



if SERVER then


    function ENT:GetSensitiveHADS()
        return self:GetData("sensitivehads",false)
    end



    function ENT:SetSensitiveHADS(on)

        self:SetData("sensitivehads",on,true)
        return true
    end



    function ENT:ToggleSensitiveHADS()
        local on = not self:GetSensitiveHADS()
        return self:SetSensitiveHADS(on)
    end



end
