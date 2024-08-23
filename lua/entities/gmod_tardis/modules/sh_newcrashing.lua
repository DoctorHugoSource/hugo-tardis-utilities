

local realtimer = 0
local delay = 0
local delay2 = 0

ENT:AddHook("OnHealthChange", "BetterCrashing", function(self, newhealth, oldhealth)

    timer.Simple( 0, function()     -- 1 tick delay to let the tardis process its own state before running any of this
            if self:IsBroken() then

                if self:GetData("teleport", false) then return end -- dont do this stuff while teleporting or starting a teleport

                    self:SetFlight(true) -- make the tardis enable flight mode when becoming heavily damaged, because it keeps doing that in the show for some reason and it's a fun gameplay idea
                                         -- also i'm aware this will enable flight mode every time it takes any damage, but ill just keep that in cause it adds chaos and thats fun
                                         -- this effectively creates the objective of reaching the handbrake to land the tardis while being thrown around the console room
                        if self:IsBroken() and self:GetFlight() then


                            local chance = math.random(0, 10)

                                if chance < 2 then -- small chance to open the door on any given collision, adds some more chaos and fear of falling out
                                    if not self:DoorOpen() then
                                        self:ToggleDoor() -- got this idea from the show itself too, man the tardis behaves really weirdly when crashing (11th hour, twice upon a time)
                                    end                   -- also the door lock can mitigate this which adds a new use for it and also a bit more mechanical 'deph' to a skilled tardis operator so thats cool
                                end
                        end

                    if not self:GetHandbrake() then
                    self:GetPhysicsObject():AddVelocity(Vector(0,0,250)) -- make it get going to enable the broken flight mode
                    end

            end
    end)

end)






ENT:AddHook("OnTakeDamage", "NewBreakDownEffects", function(self, dmginfo)

    if not IsValid(self.interior) then return end

    if self:GetHealth() == 0 then return end

    if dmginfo:GetDamage() <= 0 then return end  -- if damage


    local int = self.metadata.Interior.Sounds.Damage

    if dmginfo:IsDamageType(64) then

        realtimer = CurTime()
        if realtimer > delay then  -- limit the amount of interactions per second

            local intensity = dmginfo:GetDamage()

                timer.Create("newbreakdowneffects_sparks", 0.1, math.Clamp(intensity, 1, 20), function()

                    TARDIS:RandomConsoleSparks(self.interior)

                end)

                self.interior:EmitSound(int.Explosion)
                util.ScreenShake(self.interior:GetPos(), intensity * 0.5, 2, 2, 2000)

            delay = CurTime() + 2  -- try to ensure the timer can run out before the next instance of sparks is applied

        end

    else

            local intensity = (dmginfo:GetDamage() / 3)

                timer.Create("newbreakdowneffects_sparks", 0.1, math.Clamp(intensity, 1, 20), function()

                    TARDIS:RandomConsoleSparks(self.interior)

                end)



                -- if not IsValid(self.interior) then return end                -- much like below this is being replaced with a reworked damage effects function
        -- local int = self.metadata.Interior.Sounds.Damage
        -- if dmginfo:IsDamageType(DMG_BLAST) and self:GetHealth() ~= 0 then
        --     self.interior:EmitSound(int.Explosion)
        -- end
    end

end)





  -- for physics based collision damage, because OnTakeDamage doesn't detect it

function ENT:NewBreakDownEffects_Sparks(self, dmg)


    if dmg <= 0 then return end  -- if damage

        realtimer = CurTime()
        if realtimer > delay2 then  -- limit the amount of interactions per second

            local intensity = math.abs(dmg / 4)

            delay2 = CurTime() + 2  -- try to ensure the timer can run out before the next instance of sparks is applied

            timer.Create("newbreakdowneffects_sparks_s", 0.1, math.Clamp(intensity, 1, 20), function()

                TARDIS:RandomConsoleSparks(self.interior)

            end)

        end

end