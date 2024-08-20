
ENT:AddHook("PartUsed", "ControlSparks", function(self, part, ply)  -- make controls spark at low health

if not self.exterior:GetPower() and (not self:GetData("lowpowermode", false)) then return end -- dont spark if power is off

if string.match(part.ID, "console") ~= nil then return end  -- dont spark consoles themselves, cause it could be like, wood
if string.match(part.ID, "door") ~= nil then return end     -- dont spark doors

if part.ID == "door" then return end  -- dont spark doors 2

    if self.exterior:GetHealthPercent() < 70 then  -- below 70% health, should probably be configurable like the low health threshold

        local chance = math.random(0, (self.exterior:GetHealthPercent()))

            if chance < 10 then  -- sparks become increasingly more likely as health drops

                local snds = self.metadata.Exterior.Sounds
                if snds and istable(snds.BrokenFlightTurn) then
                    local snd = table.Random(snds.BrokenFlightTurn)

                    self:EmitSound(snd)
                    TARDIS:ControlSparks(part, ply)

                        if self.exterior:GetHealthPercent() < 40 then  -- encourage a bit more fire
                        TARDIS:IntFire(self)
                        end
                end

            end
    end


end)


function TARDIS:ControlSparks(part, activator)  -- allows sparks to be emitted from an arbitrary part, intended for console parts though

    local effect_data = EffectData()
    -- effect_data:SetOrigin(part:GetPos()) -- got damit some parts have their origin in stupid positions so this isnt reliable
    effect_data:SetOrigin(activator:GetEyeTrace().HitPos)  -- workaround to the above problem, but since the player will virtually always be looking at a control when using it, this should be fine

    effect_data:SetScale(2)
    effect_data:SetMagnitude(2)
    effect_data:SetRadius(1)
    util.Effect("Sparks", effect_data)  -- small sparks for controls
end



function TARDIS:IntFire(self)
    self.intfire = ents.Create("env_fire")
    self.intfire:SetKeyValue("firesize", "50")
    self.intfire:SetKeyValue("duration", "2")
    self.intfire:SetKeyValue("spawnflags", "29")
    self.intfire:SetKeyValue("StartDisabled", "0")
    self.intfire:SetKeyValue("damagescale", "-10")  -- dont actually damage the interior
    self.intfire:SetKeyValue("firedamage", "-10")
    self.intfire:SetKeyValue("fireradius", "0")
    self.intfire:SetKeyValue("Speed", "50")

    local randomvec = VectorRand(-170,170)  -- could make this use the extension's defined size/mins,maxs but i want the fire roughly centered around the console

    local selfpos = self:GetPos()

    local randomintpos = Vector(selfpos.x + randomvec.x, selfpos.y + randomvec.y, selfpos.z + 100   )

    local floortrace = util.QuickTrace(randomintpos, Vector(0,0,-100))

    self.intfire:SetPos(floortrace.HitPos)


    self.intfire:SetParent(self)
    self.intfire:Spawn()
    self.intfire:Activate()
    self.intfire:Fire("Extinguish", 25)  -- make each fire stop 25 seconds after it is spawned, allowing 5 active fires at a time
                                         -- also makes sure fire positions keep being mixed up
end




-- look i know this is bad but im fucking broken right now i cant figure out how to do this better, ill fix it another time
function TARDIS:ConsoleSparksSmall(cpos)  -- allows sparks to be emitted from an arbitrary part, intended for console parts though

    local effect_data = EffectData()
    -- effect_data:SetOrigin(part:GetPos()) -- got damit some parts have their origin in stupid positions so this isnt reliable
    effect_data:SetOrigin(cpos)  -- workaround to the above problem, but since the player will virtually always be looking at a control when using it, this should be fine

    effect_data:SetScale(2)
    effect_data:SetMagnitude(2)
    effect_data:SetRadius(1)
    util.Effect("Sparks", effect_data)  -- small sparks for controls
end

function TARDIS:ConsoleSparksLarge(cpos)  -- allows sparks to be emitted from an arbitrary part, intended for console parts though

    local effect_data = EffectData()
    -- effect_data:SetOrigin(part:GetPos()) -- got damit some parts have their origin in stupid positions so this isnt reliable
    effect_data:SetOrigin(cpos)  -- workaround to the above problem, but since the player will virtually always be looking at a control when using it, this should be fine

    effect_data:SetScale(1)
    effect_data:SetMagnitude(10)
    effect_data:SetRadius(0.5)
    util.Effect("Sparks", effect_data) -- larger sparks for console
end

function TARDIS:SplodeSParks(cpos)  -- allows sparks to be emitted from an arbitrary part, intended for console parts though

    local effect_data = EffectData()
    -- effect_data:SetOrigin(part:GetPos()) -- got damit some parts have their origin in stupid positions so this isnt reliable
    effect_data:SetOrigin(cpos)  -- workaround to the above problem, but since the player will virtually always be looking at a control when using it, this should be fine

    effect_data:SetScale(2)
    effect_data:SetMagnitude(3)
    effect_data:SetRadius(10.5)
    util.Effect("cball_explode", effect_data)  -- spark explosion for console
end

function TARDIS:ConsoleBurst(cpos)  -- allows sparks to be emitted from an arbitrary part, intended for console parts though

    local effect_data = EffectData()
    -- effect_data:SetOrigin(part:GetPos()) -- got damit some parts have their origin in stupid positions so this isnt reliable
    effect_data:SetOrigin(cpos)  -- workaround to the above problem, but since the player will virtually always be looking at a control when using it, this should be fine

    effect_data:SetScale(1)
    effect_data:SetMagnitude(3)
    effect_data:SetRadius(10.5)
    util.Effect("AR2Explosion", effect_data) -- burst of "fire" from the console
end









local timerinit4 = 0
local timerinit3 = 0
local timerinit2 = 0
local timerinit = 0
local realtimer = 0
local secondarytimer = 0
local ambientfiresound

if SERVER then

    ENT:AddHook("PowerToggled", "DramaticBreakdownEffectsSoundFix", function(self) -- for some damn reason the sounds cuts out randomly so i have to restart it regularly

        timerinit3 = CurTime()

    end)





        -- some functions for the upcoming logic

        function TARDIS:FireSoundLogic(self)

            if ambientfiresound == nil then
                ambientfiresound = CreateSound(self, "ambient/fire/fire_big_loop1.wav")
                ambientfiresound:Play()
                ambientfiresound:ChangeVolume(0.6)
                ambientfiresound:ChangePitch(90)
                ambientfiresound:SetDSP(122)
            else
                ambientfiresound:Stop()
                ambientfiresound = nil
                ambientfiresound = CreateSound(self, "ambient/fire/fire_big_loop1.wav")
                ambientfiresound:Play()
                ambientfiresound:ChangeVolume(0.6)
                ambientfiresound:ChangePitch(90)
                ambientfiresound:SetDSP(122)
            end

        end


        function TARDIS:IntExplosion(self)

            local explodetable = {
                "ambient/explosions/exp1.wav",
                "ambient/explosions/exp2.wav",
                "ambient/explosions/exp3.wav",
                "ambient/explosions/exp4.wav",
                }

                self:EmitSound(table.Random(explodetable), 75, 100, 0.7)
                util.ScreenShake(self:GetPos(), 5, 5, 2, 2000)  -- overdramatic shake effect on big explosions

        end


        function TARDIS:RandomConsoleSparks(self)

            if not istable(self.parts) then return end

            local randomvec = VectorRand(-50,50)  -- small radius around the console

            if IsValid(self.interior:GetPart("console"))  then
                selfpos = self.interior:GetPart("console"):GetPos()
            else
                for k,v in pairs (self.parts) do
                    if string.match(v.ID, "console") ~= nil then  -- workaround because SOMEONE out there doesnt have a console with an ID of 'console'
                        selfpos = v:GetPos()
                    end
                end
            end

            local randomintpos = Vector(selfpos.x + randomvec.x, selfpos.y + randomvec.y, selfpos.z + 150   )

            local toconsole = util.TraceLine({start = randomintpos, endpos = selfpos,})


                local ch = math.random(1, 4)

                    if ch == 1 then
                        TARDIS:ConsoleSparksSmall(toconsole.HitPos)
                    end
                    if ch == 2 then
                        TARDIS:ConsoleSparksLarge(toconsole.HitPos)
                    end
                    if ch == 3 then
                        TARDIS:SplodeSParks(toconsole.HitPos)
                    end
                    if ch == 4 then
                        TARDIS:ConsoleBurst(toconsole.HitPos)
                        TARDIS:ConsoleSparksSmall(toconsole.HitPos)  -- add some sparks to the burst
                    end

            local snds = self.metadata.Exterior.Sounds
            if snds and istable(snds.BrokenFlightTurn) then
                local snd = table.Random(snds.BrokenFlightTurn)
                self:EmitSound(snd)
            end

        end





ENT:AddHook("Think", "DramaticBreakdownEffects", function(self)  -- brand new and dramatic effects for low health mode, lowkey intended to be sensory overload


    -- this bit handles the fire sound

    if self.exterior:GetHealthPercent() < 40 then -- danger mode treshold

        realtimer = CurTime()

            if realtimer > timerinit3 then   -- for some damn reason the sounds cuts out randomly so i have to restart it regularly

                TARDIS:FireSoundLogic(self)

                    timerinit3 = CurTime() + 5 -- for some damn reason the sound cuts out randomly so i have to restart it regularly

            end

                if not self.exterior:GetPower() then  -- stop ambient fire sound when power is out
                    if ambientfiresound ~= nil then
                        ambientfiresound:Stop()
                        ambientfiresound = nil
                    end
                end

    end



    -- this next bit handles fire and explosions

    if not self.exterior:GetPower() then return end  -- bring things to a standstill when power is off

    if self.exterior:GetHealthPercent() < 40 then -- danger mode treshold

        realtimer = CurTime()

            if realtimer > timerinit then

                local firetimer = (self.exterior:GetHealthPercent() < 20) and 2 or 5  -- make fire spawn more often if super damaged

                timerinit = CurTime() + firetimer  -- add a fire every 5 seconds

                local chance = math.random(0, (self.exterior:GetHealthPercent()))  -- make fire more likely to spawn with lower health


                    if chance < 1 and (self.exterior:GetHealthPercent() < 20) then  -- distant explosion sounds
                                                                                    -- give the impression the tardis received system wide damage across its massive interior
                        TARDIS:IntExplosion(self)

                    end

                        if chance < 8 then  -- fire becomes increasingly more likely as health drops
                            TARDIS:IntFire(self)
                        end

            end



            -- this next bit handles console sparks

            if realtimer > timerinit4 then

                local sparktimer = (self.exterior:GetHealthPercent() < 20) and 2 or 5

                    timerinit4 = CurTime() + sparktimer - math.random(0, 1.8)  -- allow sparks to occur in more grouped up bursts occasionally

                    local chance = math.random(0, (self.exterior:GetHealthPercent()))  -- make fire more likely to spawn with lower health

                        if chance < 11 then  -- slightly more common than fire for more dramatic effect
                            TARDIS:RandomConsoleSparks(self)
                        end

            end


    end


    -- weak rumbling/shaking effect to add some atmosphere and make everything feel more unstable

    if self.exterior:GetHealthPercent() < 20 then

        secondarytimer = CurTime()

            if secondarytimer > timerinit2 then
                util.ScreenShake(self:GetPos(), 1, 5, 1, 900)
                    timerinit2 = CurTime() + 0.3  -- basically slowthink
            end
    end


end)



ENT:AddHook("HandbrakeToggled", "StuckBlinkinglightsFix", function(self, on)  -- sometimes for unknown reasons the interior gets stuck
                                                                              -- in the blinking warning lights state, this allows it to be manually reset
    self:SetData("interior-lights-blinking", false, true)

end)







end