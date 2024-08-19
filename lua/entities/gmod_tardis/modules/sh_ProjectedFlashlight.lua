if SERVER then return end


function ENT:CreateIntProjectedFlashLight()

    if self.intprojectedflashlight then return end

    local ply = self:GetCreator()

    local pfl = ProjectedTexture()


    pfl:SetTexture("effects/flashlight001")
    pfl:SetVerticalFOV(60)
    pfl:SetHorizontalFOV(50)
    pfl:SetEnableShadows(false)   --for now...

    self.intprojectedflashlight = pfl



local brightness = 1
local distance = 750
local color = Color(255,255,255)

    self.intprojectedflashlight:SetBrightness(brightness)
    self.intprojectedflashlight:SetFarZ(distance)
    self.intprojectedflashlight:SetColor(color)

    local flextpos = self.parts.door:WorldToLocal(ply:GetPos())

    self.intprojectedflashlight:SetPos (self.interior.parts.door:LocalToWorld ( flextpos ) )
    self.intprojectedflashlight:SetAngles(Angle(0,0,0))


    self.intprojectedflashlight:Update()

end



function ENT:RemoveIntProjectedFlashLight()

    if self.intprojectedflashlight then
        self.intprojectedflashlight:Remove()
        self.intprojectedflashlight = nil
    end

end



function ENT:UpdateIntProjectedFlashLight()

    if not IsValid(self.intprojectedflashlight) or not self.intprojectedflashlight then return end





    local ply = self:GetCreator()

    if self:GetCreator():GetTardisData("interior") then

        local flintpos = self.interior.parts.door:WorldToLocal(ply:EyePos())
    self.intprojectedflashlight:SetPos (self.parts.door:LocalToWorld ( flintpos ) )


    local flintang = self.interior.parts.door:WorldToLocalAngles( ply:EyeAngles() )
    self.intprojectedflashlight:SetAngles (self.parts.door:LocalToWorldAngles ( flintang ) )

    else


    local flextpos = self.parts.door:WorldToLocal(ply:EyePos())
    self.intprojectedflashlight:SetPos (self.interior.parts.door:LocalToWorld ( flextpos ) )


    local flextang = self.parts.door:WorldToLocalAngles( ply:EyeAngles() )
    self.intprojectedflashlight:SetAngles (self.interior.parts.door:LocalToWorldAngles ( flextang ) )

    self.intprojectedflashlight:Update()

end
end


ENT:AddHook("OnRemove", "intprojectedflashlight", function(self)
    if IsValid(self.intprojectedflashlight) then
        self.intprojectedflashlight:Remove()
        self.intprojectedflashlight:Remove()
    end
end)


ENT:AddHook("ShouldDrawIntProjectedFlashLight", "intprojectedflashlight", function(self)
    return self:DoorOpen(true) and self:GetCreator():FlashlightIsOn()
end)


ENT:AddHook("ShouldNotDrawIntProjectedFlashLight","intprojectedflashlight",function(self)
    if not TARDIS:GetSetting("extprojlight-enabled") then return true end
    if not IsValid(self.interior) then return true end
    if self:GetData("vortex",false) == true then return true end
end)



ENT:AddHook("Think", "intprojectedflashlight", function(self)

if not self.interior.parts then return end



    if not self.interior then return end
    local shouldon = self:CallHook("ShouldDrawIntProjectedFlashLight")
    local shouldoff = self:CallHook("ShouldNotDrawIntProjectedFlashLight")

    if shouldon and (not shouldoff) then
        if (not self.intprojectedflashlight) or (not IsValid(self.intprojectedflashlight)) then
            self:CreateIntProjectedFlashLight()
        end
        self:UpdateIntProjectedFlashLight()
    elseif self.intprojectedflashlight then
        self:RemoveIntProjectedFlashLight()
    end
end)































