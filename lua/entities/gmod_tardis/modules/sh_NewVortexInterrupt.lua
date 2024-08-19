
ENT:AddHook("InterruptTeleport", "NewVortexInterrupt", function(self)

    TARDIS:UnApplyExteriorWindowTint(self)  -- make sure the emissive window tint is removed when ripped out of the vortex

    if not self:GetData("vortex", false) then return end


    self.interior:EmitSound("hug o/tardis/default+/interior/crash/fallingoutofsky.mp3", 75, 100, 1)  -- play sound of tardis falling out of the sky
        timer.Simple(0.3, function()
        self:EmitSound("hug o/tardis/default+/interior/crash/fallingoutofsky.mp3", 75, 100, 1)  -- same as above but for some reason it doesnt play without a timer here
        end)

    self:SetData("simulatedcrashing", true, true)  -- enabled the somewhat faked crash behavior - it's slightly fake but it makes a better result than just using physics alone


    local basepos = self:GetRandomLocation(true)
    local fallpos = basepos + Vector(0,0,1000)  -- get a random location with a set distance above the ground

        self:SetPos(fallpos)


            local phy = self:GetPhysicsObject()
            local dir = TARDIS:FindClosestWall(self).HitNormal  -- get the direction of the closest wall to the tardis

                dir = dir * 1500
                phy:SetVelocity(Vector(dir.x,dir.y,600))  -- launch it away from that wall, to try as best as possible to make sure the tardis has enough room to crash
                                                                                                                                    -- without hitting like, a building
end)                                                                                         -- obviously this isnt foolproof but i guess it just has to be good enough

-- note: those two Z vectors of 1000 and 600 are a compromise of a satisfying amount of launch height and launch speed, to try and allow it to work on smaller maps aswell
-- the tardis needs enough airtime for the sound to play out, and crash at just the right time to sync with it
-- if the launch height is too high, it might not find space on a smaller map
-- if the launch velocity is too high, it'll hit the skybox
-- theoreticallyyyyy ideal would be some kind of trajectory math that predicts when the tardis will land and adjust itself based on that, to try and sync with the sound
-- but you can get a scholar to do that, im just a kid with gmod



function TARDIS:FindClosestWall(self)  -- math stuff for finding the closest wall to the tardis

    local selfpos = self:GetPos() + Vector(0,0,100)  -- place the traceline origin above the tardis because GOD DAMIT THE FILTER DOESNT WORK so it would otherwise just hit itself

    -- local exclude = {  -- why the fuck does this never work i swear to god i hate fucking traceline filters
    -- self,
    -- self.parts.door
    -- }

        local trace1 = util.QuickTrace(selfpos, Vector(0,99999,0))  -- four traces for each cardinal direction
        local trace2 = util.QuickTrace(selfpos, Vector(0,-99999,0))
        local trace3 = util.QuickTrace(selfpos, Vector(99999,0,0))
        local trace4 = util.QuickTrace(selfpos, Vector(-99999,0,0))

            local returnedlengths = {
                trace1,
                trace2,
                trace3,
                trace4,
            }


        local lowest = 99999
        local closewall

            for k, v in pairs(returnedlengths) do  -- determine the lowest distance to get the closest wall

            length = selfpos:Distance(v.HitPos)

                if length < lowest then
                lowest = length
                closewall = v
                end

            end

    return closewall
end



if SERVER then

    ENT:AddHook("Think", "SlowerDescend", function(self)

        local phy = self:GetPhysicsObject()

        if self:GetData("simulatedcrashing", false) then  -- allow turning it on and off on demand
            phy:AddVelocity(Vector(0,0,80))  -- make it fall slower to give it some airtime without requiring an insanely high skybox
        end

    end)

end


ENT:AddHook("PhysicsCollide", "SimulatedCrashingEnd", function(self, data, collider)  -- handle the final impact, disable fake crash behavior

    if self:GetData("simulatedcrashing", false) then
        self:EmitSound("hug o/tardis/default+/interior/crash/tardishardcrash.mp3", 75, 100, 1)
        self:StopSound("hug o/tardis/default+/interior/crash/fallingoutofsky.mp3")  -- stop the falling sound if it lands early
        self:SetData("simulatedcrashing", false, true)
    end

end)
