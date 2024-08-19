if SERVER then return end


ENT:AddHook("DematStart", "dematsoundfix", function(self)

    -- local plyinside = IsValid(self:GetCreator():GetTardisData("interior"))

    -- if not plyinside then return end

    local snd = TARDIS:PickDematSound(self)

    TARDIS:DelocalizedDematSound(self, snd)

        local duration = SoundDuration(snd)

        timer.Simple(25, function()  -- duration - 0.1 -- the function that checks for sound length is FUCKED so i have to use a hardcoded timer for now

        TARDIS:CleanupDelocalizedSoundDemat(self)

        end)

end)



function TARDIS:PickDematSound(self)

    local intsounds = self.metadata.Interior.Sounds.Teleport
    local extsounds = self.metadata.Exterior.Sounds.Teleport
    local snd


        if self:GetFastRemat() and self:GetMatHop() then
            snd = intsounds.mathop
        elseif self:GetFastRemat() then
            snd = intsounds.fullflight or extsounds.fullflight
        else
            snd = intsounds.demat or extsounds.demat
        end


        if (self:IsLowHealth() or self:GetData("force-demat", false)) and not self:GetData("redecorate") then

            if self:GetFastRemat() and self:GetMatHop() then
                snd = intsounds.mathop
            elseif self:GetFastRemat() then
                snd = intsounds.fullflight_damaged or extsounds.fullflight_damaged
            else
                snd = intsounds.demat_damaged or extsounds.demat_damaged
            end

        end

    return snd

end



function TARDIS:DelocalizedDematSound(self, snd)

    self.interior:StopSound(snd) -- stop the original sound so it doesnt play twice

    self.sndpropdumydemat = ents.CreateClientProp("models/props_junk/PopCan01a.mdl")  -- create the carrier dummy prop
    self.sndpropdumydemat:SetNoDraw(true)
    self.sndpropdumydemat:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
    self.sndpropdumydemat:SetMoveType(MOVETYPE_NONE)
    self.sndpropdumydemat:SetPos(self.interior:GetPos())

    self.sndpropdumydemat.dematsoundfix = CreateSound(self.sndpropdumydemat, snd) -- create the sound itself
    self.sndpropdumydemat.dematsoundfix:Play()
    self.sndpropdumydemat.dematsoundfix:ChangeVolume(1,0)

end



function TARDIS:CleanupDelocalizedSoundDemat(self)

    if not IsValid(self.sndpropdumydemat) then return end

    self.sndpropdumydemat.dematsoundfix:Stop()
    self.sndpropdumydemat.dematsoundfix = nil
    self.sndpropdumydemat:Remove()

end



ENT:AddHook("PreMatStart", "matsoundfix", function(self)

    if self:GetFastRemat() then return end

    local snd = TARDIS:PickMatSound(self)

    TARDIS:DelocalizedMatSound(self, snd)

        local duration = SoundDuration(snd)

        timer.Simple(25, function()  --         timer.Simple(duration - 0.1, function() -- the function that checks for sound length is FUCKED so i have to use a hardcoded timer for now

        TARDIS:CleanupDelocalizedSoundMat(self)

        end)

end)



function TARDIS:PickMatSound(self)

    local intsounds = self.metadata.Interior.Sounds.Teleport
    local extsounds = self.metadata.Exterior.Sounds.Teleport
    local snd

        if self:GetFastVortexRemat() then
        snd = intsounds.mat_short or extsounds.mat_short
        elseif self:IsLowHealth() then
        snd = intsounds.mat_damaged or extsounds.mat_damaged
        else
        snd = intsounds.mat or extsounds.mat
        end

    return snd

end



function TARDIS:DelocalizedMatSound(self, snd)

    self.interior:StopSound(snd) -- stop the original sound so it doesnt play twice

    self.sndpropdumymat = ents.CreateClientProp("models/props_junk/PopCan01a.mdl")  -- create the carrier dummy prop
    self.sndpropdumymat:SetNoDraw(true)
    self.sndpropdumymat:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
    self.sndpropdumymat:SetMoveType(MOVETYPE_NONE)
    self.sndpropdumymat:SetPos(self.interior:GetPos())

    self.sndpropdumymat.matsoundfix = CreateSound(self.sndpropdumymat, snd) -- create the sound itself
    self.sndpropdumymat.matsoundfix:Play()
    self.sndpropdumymat.matsoundfix:ChangeVolume(1,0)

end



function TARDIS:CleanupDelocalizedSoundMat(self)

    if not IsValid(self.sndpropdumymat) then return end

    self.sndpropdumymat.matsoundfix:Stop()
    self.sndpropdumymat.matsoundfix = nil
    self.sndpropdumymat:Remove()

end



ENT:AddHook("Think", "delocalsoundstate", function(self)

    local enabled = LocalPlayer():GetTardisData("outside")

    if IsValid(self.sndpropdumydemat) and (self.sndpropdumydemat.dematsoundfix ~= nil) then  -- for demat sound

        if enabled then -- if in thirdperson, make the sound inaudibly quiet but keep it technically active - this prevents source from stopping it altogether
            self.sndpropdumydemat:SetPos(self.thpprop:GetPos())  -- set the carrier's position to the exterior camera
            self.sndpropdumydemat.dematsoundfix:ChangeVolume(0.02,0)
        else
            self.sndpropdumydemat:SetPos(self.interior:GetPos())  -- if not in thirdperson view play sound in interior as usual
            self.sndpropdumydemat.dematsoundfix:ChangeVolume(1,0)
        end

    end



    if IsValid(self.sndpropdumymat) and (self.sndpropdumymat.matsoundfix ~= nil) then  -- for mat sound

        if enabled then
            self.sndpropdumymat:SetPos(self.thpprop:GetPos())
            self.sndpropdumymat.matsoundfix:ChangeVolume(0.02,0)
        else
            self.sndpropdumymat:SetPos(self.interior:GetPos())
            self.sndpropdumymat.matsoundfix:ChangeVolume(1,0)
        end

    end

    end)






ENT:AddHook("HandbrakeToggled", "CleanupDelocalizedSound", function(self, on)

    if on then
        TARDIS:CleanupDelocalizedSoundDemat(self)
        TARDIS:CleanupDelocalizedSoundMat(self)
    end

end)


-- ENT:AddHook("InterruptTeleport", "StopSound", function(self)



-- end)



ENT:AddHook("OnRemove", "CleanupDelocalizedSound", function(self)

    if IsValid(self.sndpropdumydemat) then
    TARDIS:CleanupDelocalizedSoundDemat(self)
    end

    if IsValid(self.sndpropdumymat) then
    TARDIS:CleanupDelocalizedSoundMat(self)
    end

end)

----------------------------------------------------------------------------------------------------------------------------------------------
-- 1.2

-- function TARDIS:CreateSoundDummyPropMat(self) -- create a 'carrier' that houses the sound and allows it to move

--     if not self.sndpropdumymat then
--             self.sndpropdumymat = ents.CreateClientProp("models/props_junk/PopCan01a.mdl")
--             self.sndpropdumymat:SetNoDraw(true)
--             self.sndpropdumymat:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
--             self.sndpropdumymat:SetMoveType(MOVETYPE_NONE)
--             self.sndpropdumymat:SetPos(self.interior:GetPos()) -- put it into the interior
--     end

-- end
-- function TARDIS:DelocalizedSoundMat(self, snd)

--     self.interior:StopSound(snd) -- stop the original sound so it doesnt play twice

--         if not self.sndpropdumymat.matsoundfix then
--         self.sndpropdumymat.matsoundfix = CreateSound(self.sndpropdumymat, snd) -- create the sound entity
--         self.sndpropdumymat.matsoundfix:Play()
--         self.sndpropdumymat.matsoundfix:ChangeVolume(1,0)
--         end

-- end

----------------------------------------------------------------------------------------------------------------------------------------------
-- 5

-- ENT:AddHook("PreMatStart", "matsoundfix", function(self)

-- local plyinside = IsValid(self:GetCreator():GetTardisData("interior"))

-- if not plyinside then return end

--     if self:GetFastRemat() then return end

--         local intsounds = self.metadata.Interior.Sounds.Teleport
--         local extsounds = self.metadata.Exterior.Sounds.Teleport
--         local snd

--             if self:IsLowHealth() then
--             snd = intsounds.mat_damaged or extsounds.mat_damaged
--             else
--             snd = intsounds.mat or extsounds.mat
--             end

--                 TARDIS:DelocalizedSoundMat(self, snd)

-- end)

----------------------------------------------------------------------------------------------------------------------------------------------
-- 6.1

-- function TARDIS:CleanupDelocalizedSoundMat(self)

--     if self.sndpropdumydemat and self.sndpropdumymat then

--         if self.sndpropdumymat.matsoundfix then
--         self.sndpropdumymat.matsoundfix:Stop()
--         self.sndpropdumymat.matsoundfix = nil
--         end

--     end
-- end

----------------------------------------------------------------------------------------------------------------------------------------------
-- 6

-- ENT:AddHook("StopMat", "matsoundfixcleanup", function(self)

--     if self.sndpropdumymat and self.sndpropdumymat.matsoundfix then

--         timer.Simple( 5, function()
--         if IsValid(self) then
--             if not self:GetData("demat") then
--                 TARDIS:CleanupDelocalizedSoundMat(self)
--             end
--             end
--         end)

--     end
-- end)





----------------------------------------------------------------------------------------------------------------------------------------------
-- 7
















----------------------------------------------------------------------------------------------------------------------------------------------
-- 4

-- ENT:AddHook("StopDemat", "dematsoundfixcleanup", function(self)

--     if self.sndpropdumydemat and self.sndpropdumydemat.dematsoundfix then

--         timer.Simple( 10, function()

--                 TARDIS:CleanupDelocalizedSoundDemat(self)

--         end)
--     end
-- end)

----------------------------------------------------------------------------------------------------------------------------------------------
-- 5.1
----------------------------------------------------------------------------------------------------------------------------------------------
-- 1

-- ENT:AddHook("PlayerEnter", "sndpropdumycreation", function(self)

--     TARDIS:CreateSoundDummyPropDemat(self)
--     TARDIS:CreateSoundDummyPropMat(self)

-- end)

----------------------------------------------------------------------------------------------------------------------------------------------
-- 2.1

----------------------------------------------------------------------------------------------------------------------------------------------
-- 2

-- ENT:AddHook("DematStart", "dematsoundfix", function(self)

-- local plyinside = IsValid(self:GetCreator():GetTardisData("interior"))

-- if not plyinside then return end


--     local intsounds = self.metadata.Interior.Sounds.Teleport
--     local extsounds = self.metadata.Exterior.Sounds.Teleport
--     local snd


--         if self:GetFastRemat() and self:GetMatHop() then
--             snd = "hugo/tardis/mat_hop.wav"
--         elseif self:GetFastRemat() then
--             snd = intsounds.fullflight or extsounds.fullflight
--         else
--             snd = intsounds.demat or extsounds.demat
--         end


--         if (self:IsLowHealth() or self:GetData("force-demat", false))
--         and not self:GetData("redecorate")
--         then

--             if self:GetFastRemat() and self:GetMatHop() then
--                 snd = "hugo/tardis/mat_hop.wav"
--             elseif self:GetFastRemat() then
--                 snd = intsounds.fullflight_damaged or extsounds.fullflight_damaged
--             else
--                 snd = intsounds.demat_damaged or extsounds.demat_damaged
--             end

--         end

--     TARDIS:DelocalizedSoundDemat(self, snd)

-- end)

----------------------------------------------------------------------------------------------------------------------------------------------
-- 3.1

-- function TARDIS:DelocalizedSoundDemat(self, snd)

--     self.interior:StopSound(snd) -- stop the original sound so it doesnt play twice

--         if not self.sndpropdumydemat.dematsoundfix then
--         self.sndpropdumydemat.dematsoundfix = CreateSound(self.sndpropdumydemat, snd) -- create the sound entity
--         self.sndpropdumydemat.dematsoundfix:Play()
--         self.sndpropdumydemat.dematsoundfix:ChangeVolume(1,0)
--         end

-- end


-- function TARDIS:CreateSoundDummyPropDemat(self) -- create a 'carrier' that houses the sound and allows it to move with the player's camera
--                                                 -- this is necessary because a sound stops when it's out of a player's hearing range
--                                                 -- aka every time you switch from exterior to interior view or vice versa
--     if not self.sndpropdumydemat then
--             self.sndpropdumydemat = ents.CreateClientProp("models/props_junk/PopCan01a.mdl")
--             self.sndpropdumydemat:SetNoDraw(true)
--             self.sndpropdumydemat:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
--             self.sndpropdumydemat:SetMoveType(MOVETYPE_NONE)
--             self.sndpropdumydemat:SetPos(self.interior:GetPos()) -- put it into the interior
--     end

-- end