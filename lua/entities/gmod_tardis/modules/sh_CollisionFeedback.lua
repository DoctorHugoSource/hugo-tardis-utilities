

local timerinit = 0
local timerinit2 = 0
local timerinit3 = 0
local realtimer = 0
local realtimer2 = 0

-- todo: refactor literally all of this, turn all the raw code into neat little functions outside of the hook, then put only the functions into the hook

ENT:AddHook("PhysicsCollide", "CollisionFeedback", function(self, data, collider)

    local svel = data.OurOldVelocity -- shakevelocity
    local nvel = data.OurNewVelocity -- newvelocity

    local vx = math.abs(svel.x) -- is there any way to do this more efficiently???
    local vy = math.abs(svel.y)
    local vz = math.abs(svel.z)

    local nvx = math.abs(nvel.x)
    local nvy = math.abs(nvel.z)

    local hitwall = (svel.x - nvel.x > 100) or (svel.y - nvel.y > 100)  -- basically check if horizontal velocity after a collision changed significantly
    local grndtr = util.QuickTrace(self:GetPos()+Vector(0,50,20), Vector(0,0,-40), self).HitWorld  -- check if not in the air

    if vx > 100 or vy > 100 or vz > 100 then -- create an earthquake when it hits anything hard enough
    local intensity = ((vx + vy + vz) / 200)  -- shake becomes more intense as speed increases
    util.ScreenShake(self:GetPos(), intensity, 5, 2, intensity * 100)  -- shake the ground when the tardis lands, give it weight


        if (not self:IsVerticalLanding(data)) or data.OurOldVelocity.z < -1500 then  -- consider vertical landings as smooth landings and therefor dont shake unless its a hard landing
            util.ScreenShake(self.interior:GetPos(), intensity * 0.5, 5, 2, 2000)  -- also add collision shake for the interior, but more dynamic than the previous system
        end                                                                                       -- (which exclusively applied shake when losing health, not on collision)


            -- and for my next trick


        if (not self:IsVerticalLanding(data)) or data.OurOldVelocity.z < -1500 then   -- once again dont do all this nonsense on a proper, fine vertical landing
                                                                                      -- unless youre landing too hard, in that case fuck you

            if grndtr and not hitwall then return end  -- IF sliding BUT also hitting a wall harshly, allow all this stuff to run anyway
                                                       -- just makes sure you dont get ejected from the console while sliding, yet still when you hit a wall *while* sliding
                realtimer2 = CurTime() -- getreal timer

            if realtimer2 > timerinit3 then  -- once again limit the amount of interactions per second

                local ply = self:GetCreator()
                -- establish vars
                local rotvec = data.OurOldVelocity
                local rotangle = self.interior:GetAngles() - self:GetAngles()  -- try and determine the exterior's angle relative to the interior's angle


                rotvec:Rotate(rotangle)  -- try and match the exterior's velocity directions to the interior
                                        -- rotate the velocity by the above angle to make the interior's forward the same as the exterior's forward... or something like that
                local invrotvecz = rotvec.z * -1  -- reverse z axis because otherwise if the exterior falls down, you fall up in the int

                local finrotvec = Vector(rotvec.x, rotvec.y, invrotvecz)  -- this is so fucking weird, if i do rotvec.z = rotvec.z * -1 then it overrides data.OurOldVelocity's z value???
                                                                                                                                           -- which makes the landing feature STOP WORKING
                    if not ply:GetTardisData("thirdperson") then  -- dont throw the player around while piloting, just pretend theyre holding on really thight
                        if ply:GetTardisData("interior") == self.interior then  -- obviously dont throw the player around when outside

                        local mult = ply:Crouching() and 0.2 or 1  -- allow the player to negate a large part of the crash when bracing by crouching

                        ply:SetVelocity(((finrotvec * mult) * -1) * 0.5)  -- add that velocity to the player but also reverse it and also halve it because honestly idfk why

                        end
                    end

                if ply:GetTardisData("thirdperson") then  -- only do this if in thirdperson to begin with
                    if vx > 2500 or vy > 2500 or vz > 2500 then -- rip player out of thirdperson on a hard enough collision, basically forced away from the console
                        self:SetOutsideView(ply, false)

                        local mult = ply:Crouching() and 0.2 or 1  -- allow the player to negate a large part of the crash when bracing by crouching

                        ply:SetVelocity(((finrotvec * mult) * -1) * 0.5)
                        timer.Simple( 0, function() -- the impact sounds are lost during transition from thirdperson to thirdperson,
                        self.interior:EmitSound(self.interior.metadata.Interior.Sounds.Damage.BigCrash, 75, 100, 1) -- so this workaround will have to do, i dont want to add even more dumb logic
                        end)
                    end
                end

                        timerinit3 = CurTime() + 0.3  -- make sure velocity isnt applied multiple times per collision

            end

        end



        -- local clvx = math.Clamp(data.OurOldVelocity.x, 0, 1000)
        -- local clvy = math.Clamp(data.OurOldVelocity.y, 0, 1000)
        -- local clvz = math.Clamp(data.OurOldVelocity.z, 0, 1000)


                -- ply:SetVelocity(data.OurOldVelocity * 0.5)  -- i know this technically adds velocity and thats the point
        -- ply:SetVelocity(Vector(clvx, clvy, clvz))  -- this kinda gimps the forces and idk why


    end



    if not self:IsVerticalLanding(data) then  -- dont play collision sounds when it's already going to play the landing sound

        -- self:SetData("IsSliding", false, true)
        -- self:GetData("IsSliding", false)  it seems the ground trace works better here but the sliding state data may be needed at another point so ill leave it here
        if grndtr and not hitwall then return end  -- dont play collision sounds when sliding because it behaves weirdly unless you come to a sudden stop

        realtimer = CurTime() -- getreal timer


            if realtimer > timerinit2 then

                local intimpactsound = self.interior.metadata.Interior.Sounds.Damage.BigCrash

                if vx > 2000 or vy > 2000 or vz > 2000 then -- hard collision sound to give it more presence in the world
                    self:EmitSound("p00gie/tardis/fall.wav", 75, 100, 1)
                    self.interior:EmitSound(intimpactsound, 75, 100, 1)
                end

                if vx > 1500 or vy > 1500 or vz > 1500 then -- a more 'pained' collision sound at slightly higher velocities, just for variety
                    if vx > 2000 or vy > 2000 or vz > 2000 then return end  -- dont have two collision sounds overlapping
                    self:EmitSound("hug o/tardis/collisions/ext/impact_very_large.ogg", 75, 100, 1)
                    self.interior:EmitSound(intimpactsound, 75, 100, 1)

                    timerinit2 = CurTime() + 2  -- dont allow hard collision sound to be spammed
                    timerinit = CurTime() + 0.5  -- sync with light collision sounds
                end



            end


                if realtimer > timerinit then

                    local collisionsoundtable = {  -- list of collision sounds for the exterior
                    "hug o/tardis/collisions/ext/collision_short.ogg",
                    "hug o/tardis/collisions/ext/collision_short2.ogg",
                    }

                    local intimpactsound = self.interior.metadata.Interior.Sounds.Damage.Crash  -- same for the interior

                    if not (vx > 1500 or vy > 1500 or vz > 1500) then  -- dont have two collision sounds overlapping
                        if vx > 400 or vy > 400 or vz > 400 then -- exterior collision sounds to make it feel like every other entity that interacts with the world
                            self:EmitSound(table.Random(collisionsoundtable), 75, 100, 1)
                            self.interior:EmitSound(intimpactsound, 75, 100, 1)
                        end
                    end

                        timerinit = CurTime() + 0.5  -- allow collision sounds once every few ticks to avoid it being spammed every frame

                end

    end

end)