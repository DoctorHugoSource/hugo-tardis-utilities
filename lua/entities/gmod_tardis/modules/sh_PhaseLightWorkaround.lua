
ENT:AddHook("Think", "phasefix", function(self)  -- ridiculously hacky BUT the built in function that is supposed to work to begin with
                                                 -- DOESNT WORK andive spent a literal week on this goddamn effect so im finishing it n o w

local demat = self:GetData("demat", false)
local mat = self:GetData("mat", false)
local vortex = self:GetData("vortex", false)
local invortex = self:GetData("enablevortexspin", false)  -- since this is set to enable a short bit after being in the vortex it makes sure demat is fully completed before cutting off the effect

if CLIENT then

    if (demat or mat or vortex) and not invortex then



        if not self.phaselight then
        self.phaselight = ProjectedTexture()
        end

            local phaselight = self.phaselight

            phaselight:SetTexture("effects/flashlight/soft")
            phaselight:SetVerticalFOV(50)
            phaselight:SetHorizontalFOV(50)
            phaselight:SetEnableShadows(false)

            phaselight:SetBrightness(0)
            phaselight:SetFarZ(20)
            phaselight:SetLightWorld(false)

            phaselight:SetPos (self:GetPos() + Vector(0,0,100) )
            phaselight:SetAngles(Angle(90,0,0))

            phaselight:Update()


        if not self.phaselight2 then
        self.phaselight2 = ProjectedTexture()
        end

            local phaselight2 = self.phaselight2

            self.phaselight2:SetTexture("effects/flashlight/soft")
            self.phaselight2:SetVerticalFOV(50)
            self.phaselight2:SetHorizontalFOV(50)
            self.phaselight2:SetEnableShadows(false)

            self.phaselight2:SetBrightness(0)
            self.phaselight2:SetFarZ(20)
            self.phaselight2:SetLightWorld(false)

            self.phaselight2:SetPos (self:GetPos() + Vector(0,0,100) )
            self.phaselight2:SetAngles(Angle(90,0,0))

            self.phaselight2:Update()


        if not self.phaselight3 then
        self.phaselight3 = ProjectedTexture()
        end

            local phaselight3 = self.phaselight3

            self.phaselight3:SetTexture("effects/flashlight/soft")
            self.phaselight3:SetVerticalFOV(50)
            self.phaselight3:SetHorizontalFOV(50)
            self.phaselight3:SetEnableShadows(false)

            self.phaselight3:SetBrightness(0)
            self.phaselight3:SetFarZ(20)
            self.phaselight3:SetLightWorld(false)

            self.phaselight3:SetPos (self:GetPos() + Vector(0,0,100) )
            self.phaselight3:SetAngles(Angle(90,0,0))

            self.phaselight3:Update()


    --             if not self.phaselight4 then
    --     self.phaselight4 = ProjectedTexture()
    --     end
    --
    --         local phaselight4 = self.phaselight4
    --
    --         self.phaselight4:SetTexture("effects/flashlight/soft")
    --         self.phaselight4:SetVerticalFOV(50)
    --         self.phaselight4:SetHorizontalFOV(50)
    --         self.phaselight4:SetEnableShadows(false)
    --
    --         self.phaselight4:SetBrightness(0)
    --         self.phaselight4:SetFarZ(20)
    --         self.phaselight4:SetLightWorld(false)
    --
    --         self.phaselight4:SetPos (self:GetPos() + Vector(0,0,100) )
    --         self.phaselight4:SetAngles(Angle(90,0,0))
    --
    --         self.phaselight4:Update()
    --
    --
    --
    --                     if not self.phaselight5 then
    --     self.phaselight5 = ProjectedTexture()
    --     end
    --
    --         local phaselight5 = self.phaselight5
    --
    --         self.phaselight5:SetTexture("effects/flashlight/soft")
    --         self.phaselight5:SetVerticalFOV(50)
    --         self.phaselight5:SetHorizontalFOV(50)
    --         self.phaselight5:SetEnableShadows(false)
    --
    --         self.phaselight5:SetBrightness(0)
    --         self.phaselight5:SetFarZ(20)
    --         self.phaselight5:SetLightWorld(false)
    --
    --         self.phaselight5:SetPos (self:GetPos() + Vector(0,0,100) )
    --         self.phaselight5:SetAngles(Angle(90,0,0))
    --
    --         self.phaselight5:Update()
    --
    --
    --
    --                          if not self.phaselight6 then
    --     self.phaselight6 = ProjectedTexture()
    --     end
    --
    --         local phaselight6 = self.phaselight6
    --
    --         self.phaselight6:SetTexture("effects/flashlight/soft")
    --         self.phaselight6:SetVerticalFOV(50)
    --         self.phaselight6:SetHorizontalFOV(50)
    --         self.phaselight6:SetEnableShadows(false)
    --
    --         self.phaselight6:SetBrightness(0)
    --         self.phaselight6:SetFarZ(20)
    --         self.phaselight6:SetLightWorld(false)
    --
    --         self.phaselight6:SetPos (self:GetPos() + Vector(0,0,100) )
    --         self.phaselight6:SetAngles(Angle(90,0,0))
    --
    --         self.phaselight6:Update()



    else

        if self.phaselight3 ~= nil then

        self.phaselight:Remove()
        self.phaselight = nil
        self.phaselight2:Remove()
        self.phaselight2 = nil
        self.phaselight3:Remove()
        self.phaselight3 = nil

        end


    end

end

end)





