

 hook.Add("CalcView", "tardis-outside-vortexfix", function(ply, pos, ang)

    if ply:GetTardisData("outside") then

        local tardis = ply:GetTardisData("exterior")

        tardis.oldview = (tardis:WorldToLocalAngles(ply:EyeAngles()))

    end

end)

if CLIENT then
    ENT:AddHook("MatStart","vortexexitcamerafix",function(self)

        local ply = self:GetCreator()

        if ply:GetTardisData("outside") then

            if self:GetFastRemat() then
                ply:SetEyeAngles(self:LocalToWorldAngles( Angle(self.oldview.p, self.oldview.y, 0) ))  -- retain the exact viewing angle of the exterior from the vortex
            else -- since the tardis is spinning in vortex flight, there is no defined angle you're viewing it from, so just make it face the front of it
                ply:SetEyeAngles(self:LocalToWorldAngles(Angle(ply:EyeAngles().p, 180, 0)))
            end

        end

    end)
end




if SERVER then

    ENT:AddHook("DematStart", "ResetVortexStabiliser", function(self)  -- for some reason this damn thing doesnt reliably work

    self:SetData("enablevortexspin", false, false)  -- reset vortexspin for the next demat

    end)



    ENT:AddHook("StopDemat", "vortexspindirection", function(self)

        self:SetData("lockedang",Angle(0,0,0), true)            -- idk if this is necessary but this whole lockedang thing is so weird...

        if self:GetFastRemat() and (not self:IsLowHealth()) then return end

        if self:GetMultiloopStabiliser() then
            timer.Simple( 0.8, function()  -- ensure the spin doesnt begin too early, else you can see it start spinning before entering the vortex
                self:SetData("enablevortexspin", true, false)
            end)
        else                               -- if multiloop stabilisers are not active, enable spin early
            self:SetData("enablevortexspin", true, false)
        end

    end)



ENT:AddHook("PhysicsUpdate","vortexspin",function(self,ph)
    -- Simulate flight without actually moving anywhere
    if self:GetData("vortex", false) and self:GetData("enablevortexspin", false) then
        local vel = ph:GetVelocity()
        local brake = vel * -(self:GetData("vortexready") and 1 or 0.02)
        ph:AddVelocity(brake)

        if self:GetData("vortex") then
            local up = self:GetUp()
            local ri2 = self:GetRight()
            local fwd2 = self:GetForward()
            local ang = self:GetAngles()
            local cen = ph:GetMassCenter()
            local lev = ph:GetInertia():Length()
            local angvel = ph:GetAngleVelocity()
            local vectory

            local vel = 0
            local rforce = 2
            local mul = 6      -- 3 for classic (default tardis addon) spin, 12 for fast modern spin, 6 for tuat-style spin
            local tilt = 0
            local tiltmul = 7
            if self:GetData("vortex") then
                vel = vel + 1
                tilt = tilt + 1
            end

            if self:GetData("doorstatereal",false) and (not self:IsLowHealth()) then         -- apply heavier brake with door open than usual (unless damaged)
                ph:AddAngleVelocity(ph:GetAngleVelocity() * -0.05)
            end

            if self:GetSpinDir() == 0 and (not self:IsLowHealth()) then                      -- after spin is turned off, make sure it comes to a stop much faster than usual so you can disable spin on a dime for landing
                ph:AddAngleVelocity(ph:GetAngleVelocity() * -0.05)
            end

            -- with the new multiloop stabiliser control this isnt actually needed anymore
            -- if not self:GetCreator():GetTardisData("interior") then     -- allllso make sure it doesnt spin when the pilot is outside, this is to make sure it doesnt land offset when summoning it from outside
            --     ph:AddAngleVelocity(ph:GetAngleVelocity() * -0.05)  -- (also once again shows the single player centric nature of this addon, will have to update to check for other players eventually..)                                                                                                              
            -- end

            if TARDIS:IsBindDown(self.pilot,"float-brake") then  -- allow player to still stop and rotate manually because idk why not
                ph:AddAngleVelocity(ph:GetAngleVelocity() * -0.05)
            end

            if TARDIS:IsBindDown(self.pilot,"flight-rotate") then
                if TARDIS:IsBindDown(self.pilot,"flight-left") then
                    ph:AddAngleVelocity(Vector(0,0,rforce))
                elseif TARDIS:IsBindDown(self.pilot,"flight-right") then
                    ph:AddAngleVelocity(Vector(0,0,-rforce))
                end

            elseif (not (self:GetSpinDir() == 0)) or (self:IsLowHealth()) then  -- ignore spin being disabled if on low health, make tardis uncontrollable
                local twist = Vector(0, 0, vel * mul * - (self:GetSpinDir() or (self:IsLowHealth() and 1)))  -- just set it to 1 if on low health, doesnt really matter with all the flipping
                ph:AddAngleVelocity(twist)
                local vang = self:GetData("lockedang", nil)
                -- local vangfw = vang:Forward() * -100
                -- local vangup = vang:Up() * -100
                ph:ApplyForceOffset( up * -ang.p, cen - fwd2 * lev)
                ph:ApplyForceOffset(-up * -ang.p, cen + fwd2 * lev)
                ph:ApplyForceOffset( up * -(ang.r - (tilt * tiltmul)), cen - ri2 * lev)
                ph:ApplyForceOffset(-up * -(ang.r - (tilt * tiltmul)), cen + ri2 * lev)
                ph:ApplyForceOffset( vang:Forward() * 150, cen + up * lev)  -- turn this off for classic (tardis addon default) style spin
                ph:ApplyForceOffset(-vang:Forward() * 150, cen - up * lev)  -- turn this off for classic (tardis addon default) style spin
                                                                            -- then make sure to turn the brake below off V

                if not self:IsLowHealth() then  -- disable stabilizers when damaged
                    local angbrake = angvel * -0.015  -- taken from regular flight code, apprently this stabilizes it but i barely understand how
                    ph:AddAngleVelocity(angbrake)
                end


            -- lean into the direction of horizontal vortex flight
            if self:GetVortexDrift() or self:IsLowHealth() then  -- disable if vortex drift compensators are active or ignore if tardis is damaged (uncontrollable)
                vectory = 400 * math.sin(2 * math.pi * 0.3 * CurTime() - 1) -- finally the same value as in vortex.lua... only took about over a day and 12 stages of grief to transfer ONE NUMBER
                local vectoryforce = Vector(0, vectory / 100, 0)              -- and it actually IS STILL SUBTLY DIFFERENT BY LIKE +- 20 UNITS

                if math.abs(vectory) >= 100 then
                ph:ApplyForceOffset( vectoryforce * 5, cen + (up * 2) * lev)
                ph:ApplyForceOffset(-vectoryforce * 5, cen - (up * 2) * lev)
                ph:ApplyForceOffset( vectoryforce * -5, cen + (up * -2) * lev)
                ph:ApplyForceOffset(-vectoryforce * -5, cen - (up * -2) * lev)
                end
            end


            --  if damaged, make it go haywire
            if self:IsLowHealth() then
                ph:AddAngleVelocity(Vector(-vectory * 0.07,vectory * 0.035,vectory * 0.02))
            end


            end
        end
    end


    -- as mentioned in the vortex part file - it seems TARDIS:IsBindDown doesn't work in the vortex part's file, so i have to use tardis data to get around it
    -- if there is a better way, this will be changed
    if TARDIS:IsBindDown(self.pilot,"flight-forward") then
        self:SetData("vortexup", true, true)
    else
        self:SetData("vortexup", false, true)
    end
    if TARDIS:IsBindDown(self.pilot,"flight-right") then
        self:SetData("vortexright", true, true)
    else
        self:SetData("vortexright", false, true)
    end
    if TARDIS:IsBindDown(self.pilot,"flight-left") then
        self:SetData("vortexleft", true, true)
    else
        self:SetData("vortexleft", false, true)
    end
    if TARDIS:IsBindDown(self.pilot,"flight-backward") then
        self:SetData("vortexdown", true, true)
    else
        self:SetData("vortexdown", false, true)
    end
    if TARDIS:IsBindDown(self.pilot,"flight-boost") then
        self:SetData("vortexforward", true, true)
    else
        self:SetData("vortexforward", false, true)
    end
    if TARDIS:IsBindDown(self.pilot,"flight-down") then
        self:SetData("vortexback", true, true)
    else
        self:SetData("vortexback", false, true)
    end

    if self:GetPhyslock() or (self:GetSpinDir() == 0) and (not self:IsLowHealth()) then
        self:SetData("vortexmovement", false, true)
    else
        self:SetData("vortexmovement", true, true)
    end


end)


ENT:AddHook("MatStart", "AutomaticVortexStabiliser", function(self)

    if self:IsLowHealth() then return end  -- no stabilising for you if damaged
    if self:GetPhyslock() then return end  -- if physlock already active dont do anything

    if self:GetMultiloopStabiliser() and not self:GetPhyslock() then
        self:TogglePhyslock()
    end

    timer.Simple( 0.3, function()
        if self:GetPhyslock() then
        self:TogglePhyslock()
        end
    end)

    self:SetData("enablevortexspin", false, false)  -- reset vortexspin for the next demat

end)


end

