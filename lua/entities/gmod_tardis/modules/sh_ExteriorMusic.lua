
-- this shits gonna be so badass literally best feature in the addon
-- groovy time

if SERVER then return end





ENT:AddHook("Think", "delocalizedmusic", function(self)

    local sound = self:GetData("delocalsong", nil)




    TARDIS:CreateSoundDummyPropMusic(self)

    TARDIS:DelocalizedMusic(self, sound)

    TARDIS:HandleDelocalizedMusic(self, sound)

    end)



    function TARDIS:CreateSoundDummyPropMusic(self) -- create a 'carrier' that houses the sound and allows it to move

        if not self.sndpropdumymusic then
                self.sndpropdumymusic = ents.CreateClientProp("models/props_junk/PopCan01a.mdl")
                self.sndpropdumymusic:SetNoDraw(true)
                self.sndpropdumymusic:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
                self.sndpropdumymusic:SetMoveType(MOVETYPE_NONE)
                self.sndpropdumymusic:SetPos(self.interior:GetPos()) -- put it into the interior
        end

    end



    function TARDIS:DelocalizedMusic(self, sound)

        if sound == nil then return end


        if not self.sndpropdumymusic.song then
            self.sndpropdumymusic.song = CreateSound(self.sndpropdumymusic, sound) -- create the sound entity
            self.sndpropdumymusic.song:ChangeVolume(0,0)
            end

    end



    function TARDIS:HandleDelocalizedMusic(self, sound) -- handle logic for the sound entity

        if sound == nil then return end

        if not IsValid(self.interior) then return end

        local inside = LocalPlayer():GetTardisData("interior")
        local open = self:DoorOpen(true)
        local poweron = self:GetPower()
        local outside = LocalPlayer():GetTardisData("outside")



            if inside then
            self.sndpropdumymusic:SetPos(self.interior:GetPos())
            self.sndpropdumymusic.song:Play()
            self.sndpropdumymusic.song:ChangeVolume(1,0)
            else
            self.sndpropdumymusic:SetPos(self:GetPos())
            self.sndpropdumymusic.song:ChangeVolume(0.3,0)
            end

            if outside then -- if in thirdperson, make the sound inaudibly quiet but keep it technically active - this prevents source from stopping it altogether
                self.sndpropdumymusic:SetPos(self.thpprop:GetPos())
                self.sndpropdumymusic.song:ChangeVolume(0.2,0)
            end

            if not inside then
                if open then
                self.sndpropdumymusic.song:Play()
                self.sndpropdumymusic.song:ChangeVolume(0.3,0)
                else
                self.sndpropdumymusic.song:ChangeVolume(0.02,0)
                end
            end


            if not poweron then
            self.sndpropdumymusic.song:ChangeVolume(0.02,0)
            end

    end


    ENT:AddHook("OnRemove", "CleanupMusic", function(self)
        if IsValid(self.sndpropdumymusic) then
            if self.sndpropdumymusic.song ~= nil then
                self.sndpropdumymusic.song:Stop()
            end
            self.sndpropdumymusic:Remove()
        end
    end)


-- old sound prop logic


-- make these a function instead of hooks?
-- ENT:AddHook("PlayerExit", "updateidlepos", function(self)

-- if self:GetPower() == false then return end

--     self.sndpropdumyidle:SetPos(self:GetPos())
--     self.sndpropdumyidle.idlesounddelocal:ChangeVolume(0.3,0)

-- end)

-- ENT:AddHook("PlayerEnter", "updateidlepos", function(self)

-- if self:GetPower() == false then return end

--     self.sndpropdumyidle:SetPos(self.interior:GetPos())
--     self.sndpropdumyidle.idlesounddelocal:ChangeVolume(1,0)

-- end)


-- ENT:AddHook("ToggleDoor", "updateextsoundvol", function(self, open)

-- if self:GetPower() == false then return end

--     local plyinside = IsValid(self:GetCreator():GetTardisData("interior"))

--     if plyinside then return end


--         if open then
--         self.sndpropdumyidle.idlesounddelocal:ChangeVolume(0.3,0)
--         else
--         self.sndpropdumyidle.idlesounddelocal:ChangeVolume(0,0)
--         end

-- end)



-- ENT:AddHook("PowerToggled", "updatesoundvol", function(self, on)

--         if on then
--         self.sndpropdumyidle.idlesounddelocal:ChangeVolume(1,0)
--         else
--         self.sndpropdumyidle.idlesounddelocal:ChangeVolume(0,0)
--         end

-- end)


-- ENT:AddHook("PostInitialize", "startupsound", function(self)

--     timer.Simple(0.1, function()

--     self.sndpropdumyidle:SetPos(self:GetPos())
--     self.sndpropdumyidle.idlesounddelocal:ChangeVolume(0,0)

--     end)
-- end)



-- ENT:AddHook("ToggleDoor", "test", function(self, open)  -- test successful, allows for toggling of opening one door or both doors on police boxes, but requires a bodygroup for such

-- if self:GetCreator():KeyDown(IN_ATTACK2) then

--     if not open then
--         if self.parts.door:GetBodygroup(0) == 0 then
--             self.parts.door:SetBodygroup(0, 1)
--         else
--             self.parts.door:SetBodygroup(0, 0)
--         end
--     end

--     if not open then
--         if self.interior.parts.door:GetBodygroup(0) == 0 then
--             self.interior.parts.door:SetBodygroup(0, 1)
--         else
--             self.interior.parts.door:SetBodygroup(0, 0)
--         end
--     end

-- end

-- end)



