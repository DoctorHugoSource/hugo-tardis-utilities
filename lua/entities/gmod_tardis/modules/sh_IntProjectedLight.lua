
if SERVER then return end


function ENT:CreateIntProjectedLight()  -- creates primary artificial light

    if self.intprojectedlight ~= nil then return end

    local pl = ProjectedTexture()


        pl:SetTexture(self.metadata.Exterior.ProjectedLight.texture)
        pl:SetVerticalFOV(self.metadata.Interior.ProjectedLight.Vertfov or self.metadata.Exterior.Portal.height)
        pl:SetHorizontalFOV(self.metadata.Interior.ProjectedLight.Horizfov or self.metadata.Exterior.Portal.width)
        pl:SetEnableShadows(false)   --for now...


        self.intprojectedlight = pl


            local brightness = self.metadata.Interior.ProjectedLight.BrightnessMult
            local distance = self.metadata.Interior.ProjectedLight.Distance
            local shortdist = (800 - self.metadata.Interior.ProjectedLight.Shortdist)


                self.intprojectedlight:SetBrightness(brightness)
                self.intprojectedlight:SetFarZ(distance)


                local lightangle = self.interior.parts.door:GetAngles()


                    lightangle:RotateAroundAxis(lightangle:Up(), 180)
                    local lightangletbl = lightangle:ToTable()           -- ALL of this is needed because angles cant be multiplied ARGHHH
                    lightangletbl[1] = 0
                    lightangletbl[3] = 0
                    lightangle:SetUnpacked(lightangletbl[1], lightangletbl[2], lightangletbl[3])


                        self.intprojectedlight:SetPos (self.interior.parts.door:LocalToWorld ( Vector( 90, 0, 60 ) ) )
                        self.intprojectedlight:SetAngles(lightangle)
                        self.intprojectedlight:Update()

end



function ENT:CreateIntProjectedLightDoor()  -- creates secondary door-area artificial light

    if self.intprojectedlightdoor ~= nil then return end

    local pld = ProjectedTexture()


        pld:SetTexture(self.metadata.Exterior.ProjectedLight.texture)
        pld:SetVerticalFOV(self.metadata.Interior.ProjectedLight.Vertfov or self.metadata.Exterior.Portal.height)
        pld:SetHorizontalFOV(self.metadata.Interior.ProjectedLight.Horizfov or self.metadata.Exterior.Portal.width)
        pld:SetEnableShadows(false)   --for now...

        self.intprojectedlightdoor = pld


            local brightness = self.metadata.Interior.ProjectedLight.BrightnessMult
            local distance = self.metadata.Interior.ProjectedLight.Distance
            local shortdist = (800 - self.metadata.Interior.ProjectedLight.Shortdist)


                self.intprojectedlightdoor:SetBrightness(brightness)
                self.intprojectedlightdoor:SetFarZ(distance - shortdist)


                local lightangle = self.interior.parts.door:GetAngles()


                    lightangle:RotateAroundAxis(lightangle:Up(), 180)
                    local lightangletbl = lightangle:ToTable()           -- ALL of this is needed because angles cant be multiplied ARGHHH
                    lightangletbl[1] = 0
                    lightangletbl[3] = 0
                    lightangle:SetUnpacked(lightangletbl[1], lightangletbl[2], lightangletbl[3])


                        self.intprojectedlightdoor:SetPos (self.interior.parts.door:LocalToWorld ( Vector( 110, 0, 60 ) ) )
                        self.intprojectedlightdoor:SetAngles(lightangle)
                        self.intprojectedlightdoor:Update()

end


function ENT:RemoveIntProjectedLight()  -- removes the primary artificial light

    -- self:SetData("pl-color",nil)         -- why is this here to begin with? dont remember but also idk what it does
    -- self:SetData("pl-brightness",nil)
    -- self:SetData("pl-distance",nil)

    if self.intprojectedlight ~= nil then
        self.intprojectedlight:Remove()
        self.intprojectedlight = nil
    end

end

function ENT:RemoveIntProjectedLightDoor()  -- removes the secondary, door-area artificial light

        if self.intprojectedlightdoor ~= nil then
            self.intprojectedlightdoor:Remove()
            self.intprojectedlightdoor = nil
        end

end

function ENT:UpdateIntProjectedLight()  -- updates primary artificial light

    if self.intprojectedlight == nil then return end

    local color = self.intprojectedlightcolor

    self.intprojectedlight:SetHorizontalFOV(self.fov)
    self.intprojectedlight:SetColor(color)
    self.intprojectedlight:Update()

end

function ENT:UpdateIntProjectedLightDoor()  -- updates the secondary, door-area artificial light

    if self.intprojectedlightdoor == nil then return end

    local color = self.intprojectedlightcolor


    if self:GetData("vortex", false) then  -- use vortex colors when in vortex flight to give the feeling that the vortex's light is shining in

        if self:GetData("CustomVortexEnabled", false) == false then  -- use extension's default tint color from metadata
            color = self.interior.metadata.Interior.WindowTint.ExtTint:ToColor()
        end

        if self:GetData("CustomVortexEnabled", false) == true then  -- enable vortex swap tint
            color = self:GetData("VortexExtColor", nil):ToColor()  -- get the color from vortexswap.lua
        end                                                         -- specifically it uses the exterior window tint color

        if GetConVar("tardis2_debug"):GetBool() == true then  -- for debugging
        color = Color(180, 88, 103)
        end

    end

    self.intprojectedlightdoor:SetHorizontalFOV(self.fov)
    self.intprojectedlightdoor:SetColor(color)
    self.intprojectedlightdoor:Update()

end



        ENT:AddHook("OnRemove", "intprojectedlight", function(self)  -- removes both artificial lights when tardis is deleted
            if IsValid(self.intprojectedlight) then
                self.fov = 0
                self.intprojectedlight:Remove()
                self.intprojectedlightdoor:Remove()
            end
        end)

        -- commenting this out because i think the check below is enough by itself, improves readability a bit
        -- ENT:AddHook("ShouldDrawIntProjectedLight", "intprojectedlight", function(self)  -- determines if the lights should be drawn at all
        --     return self:DoorOpen(true) and self:GetPower() == false
        -- end)

        if CLIENT then
            ENT:AddHook("ShouldNotDrawIntProjectedLight", "intprojectedlight", function(self)  -- overrides the above function to force both lights to not draw no matter what 
                if not TARDIS:GetSetting("extprojlight-enabled") then return true end
                if not IsValid(self.interior) then return true end
                if self:GetData("vortex",false) == true then return true end
                if self:GetPower() == true then return true end
                if self:DoorOpen(true) == false then return true end
            end)
        end



ENT.fov = 0                 -- initializes default light values before main think hook
local intlightfovopen = 0
local intlightfovclosed = 0


-- main think hook that calculates light parameters
ENT:AddHook("Think", "intprojectedlight", function(self)

if CLIENT then


    local tracedata = {
    start = self:LocalToWorld (Vector(50,0,30) ),
    endpos = self:LocalToWorld (Vector(700,0,-50) )
    }

        local windowtr = util.TraceLine( tracedata )
        local trpos = windowtr.HitPos


            -- get all the environmental light data to merge into the final light color and brightness
            local distcol = render.GetLightColor(trpos)
            local subpovcol1 = render.GetSurfaceColor(self:LocalToWorld (Vector(50,20,30) ), self:LocalToWorld (Vector(99999,0,-50) )  )
            local subpovcol2 = render.GetSurfaceColor(self:LocalToWorld (Vector(50,-20,30) ), self:LocalToWorld (Vector(99999,0,-50) )  )
            local povcol = (subpovcol1 * 0.5) + (subpovcol2 * 0.5)
            local ambcol = render.GetLightColor(self:LocalToWorld (Vector(50,0,30) ) )
            local dyncol = render.ComputeDynamicLighting(self:LocalToWorld (Vector(50,0,30) ), self:GetForward()  )


                self:SetData("distcol", distcol, true)
                self:SetData("povcol", povcol, true)
                self:SetData("ambcol", ambcol, true)
                self:SetData("dyncol", dyncol, true)

end



    local distcol = self:GetData("distcol", Vector(0,0,0))
    local povcol = self:GetData("povcol", Vector(0,0,0))
    local ambcol = self:GetData("ambcol", Vector(0,0,0))
    local dyncol = self:GetData("dyncol", Vector(0,0,0))


    -- todo: add an "is under sky" check to determine if the tardis is inside or outside

    -- if StormFox2 then  -- adjust simulated outside light to the time of day when stormfox2 is installed
    --     local timemodifier = StormFox2.Time.Get()

    --     if (timemodifier <= 360) or (timemodifier >= 1080) then

    --     if timemodifier >= 1080 then
    --         timemodifier = math.abs(timemodifier - 1440)
    --     end

    --     distcol = distcol * (timemodifier / 1440)
    --     ambcol = ambcol * (timemodifier / 1440)
    --     end

    -- end




        -- calculates combined color from all the above values
        local combcol = ((povcol * 2) * ambcol) + (distcol * 0.5) + (dyncol * 0.5)

        local intprojcol = combcol


            if StormFox2 then  -- adjust simulated outside light to the time of day when stormfox2 is installed
                local timemodifier = StormFox2.Time.Get()

                if (timemodifier <= 360) or (timemodifier >= 1080) then

                if timemodifier >= 1080 then
                    timemodifier = math.abs(timemodifier - 1440)
                end

                intprojcol = intprojcol * (timemodifier / 1440)
                end

            end

        if not self.interior.parts then return end

        local door = self.interior.parts.door

        door.windowtintcolor = intprojcol

        local intprojveccol = intprojcol:ToColor()
        self.intprojectedlightcolor = intprojveccol


            -- process the fake shadow 'animation' for the door opening and closing, because actual shadows dont function inside the interior
            if not self:GetPower() or GetConVar("hugoextension_tardis2_Lightbleed_Alwayson"):GetBool() then  -- if this convar is on, run it even with power on
                if self:DoorOpen(true) then

                    local animtime = self.metadata.Interior.IntDoorAnimationTime or self.metadata.Exterior.DoorAnimationTime
                    local animfactor = self.metadata.Interior.ProjectedLight.Animfactor

                    intlightfovopen = math.Approach(self.fov, self.metadata.Interior.ProjectedLight.Horizfov, FrameTime() * (animfactor / animtime))

                    intlightfovclosed = math.Approach(self.fov, 0, FrameTime() * (animfactor / animtime))

                end
            end


    if self:GetData("doorstatereal",false) then  -- if door open
    self.fov = intlightfovopen
    end

    if not self:GetData("doorstatereal",false) then  -- if door closed
        if self:GetCreator():GetTardisData("interior") then  -- THIS IS A WORKAROUND 5 MONTHS IN THE MAKING (AKA JUST KEEP THE LIGHT RENDERED WHEN OUTSIDE TO NOT DESPAWN IT)
        self.fov = intlightfovclosed
        end
    end

    if not self:DoorOpen(true) then  -- if for some reason the light fov hasn't reached 0 yet, snap it to 0 when door is fully closed  -- may be redundant? was some of the earlier code i made
        if self:GetCreator():GetTardisData("interior") then  -- WORKAROUND
        self.fov = 0
        end
    end



    if not self.interior then return end

    -- local shouldon = self:CallHook("ShouldDrawIntProjectedLight")
    local shouldoff = self:CallHook("ShouldNotDrawIntProjectedLight")


    if not shouldoff then  -- todo: investigate leaving the second light on at a very low brightness, not to light the interior but just for reflections on metallic surfaces

        self:CreateIntProjectedLight()
        self:UpdateIntProjectedLight()

    else

        if self:GetCreator():GetTardisData("interior") then  -- WORKAROUND
            self:RemoveIntProjectedLight()
        end

    end



    if not shouldoff or (GetConVar("hugoextension_tardis2_Lightbleed_Alwayson"):GetBool() and not self:DoorOpen(true) == false) then

        self:CreateIntProjectedLightDoor()
        self:UpdateIntProjectedLightDoor()

    else

            if self:GetCreator():GetTardisData("interior") then  -- WORKAROUND
                self:RemoveIntProjectedLightDoor()
            end

    end

end)



















