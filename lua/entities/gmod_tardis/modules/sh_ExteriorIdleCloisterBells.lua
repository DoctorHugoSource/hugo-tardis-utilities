if SERVER then return end

ENT:AddHook("Think", "delocalizedcloisterbells", function(self)

    local sound = self.metadata.Interior.Sounds.Cloister



    TARDIS:CreateSoundDummyPropCloister(self)

    TARDIS:DelocalizedCloisterBells(self, sound)

    TARDIS:HandleDelocalizedCloisterbells(self, sound)

    end)



    function TARDIS:CreateSoundDummyPropCloister(self) -- create a 'carrier' that houses the sound and allows it to move

        if not self.sndpropdumycloister then
                self.sndpropdumycloister = ents.CreateClientProp("models/props_junk/PopCan01a.mdl")
                self.sndpropdumycloister:SetNoDraw(true)
                self.sndpropdumycloister:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
                self.sndpropdumycloister:SetMoveType(MOVETYPE_NONE)
                self.sndpropdumycloister:SetPos(self.interior:GetPos()) -- put it into the interior
        end

    end



    function TARDIS:DelocalizedCloisterBells(self, sound)


        if not self.sndpropdumycloister.cloisterloop then
            self.sndpropdumycloister.cloisterloop = CreateSound(self.sndpropdumycloister, sound) -- create the sound entity
            self.sndpropdumycloister.cloisterloop:ChangeVolume(0,0)
            end

    end



    function TARDIS:HandleDelocalizedCloisterbells(self, sound) -- handle logic for the sound entity

        if not IsValid(self.interior) then return end

        local inside = LocalPlayer():GetTardisData("interior")
        local open = self:DoorOpen(true)
        local poweron = self:GetPower()


        local shouldoff = self.interior:CallHook("ShouldTurnOffCloisters")

        if shouldoff then
        self.sndpropdumycloister.cloisterloop:ChangeVolume(0,0)
        return end


        local shouldon = self.interior:CallHook("ShouldTurnOnCloisters")

        if shouldon then

            if inside then
            self.sndpropdumycloister:SetPos(self.interior:GetPos())
            self.sndpropdumycloister.cloisterloop:Play()
            self.sndpropdumycloister.cloisterloop:ChangeVolume(1,0)
            else
            self.sndpropdumycloister:SetPos(self:GetPos())
            self.sndpropdumycloister.cloisterloop:ChangeVolume(0.3,0)
            end


            if not inside then
                if open then
                self.sndpropdumycloister.cloisterloop:Play()
                self.sndpropdumycloister.cloisterloop:ChangeVolume(0.3,0)
                else
                self.sndpropdumycloister.cloisterloop:ChangeVolume(0,0)
                end
            end


            if not poweron then
            self.sndpropdumycloister.cloisterloop:ChangeVolume(0,0)
            end

        end

    end


    ENT:AddHook("OnRemove", "CleanupCloisters", function(self)
        if IsValid(self.sndpropdumycloister) then
            self.sndpropdumycloister.cloisterloop:Stop()
            self.sndpropdumycloister:Remove()
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



