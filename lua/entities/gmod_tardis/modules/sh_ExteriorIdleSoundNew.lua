if SERVER then return end

ENT:AddHook("Think", "delocalizedidlesound", function(self)

if self.metadata.Interior.IdleSound then
idlesnd = self.metadata.Interior.IdleSound[1].path
else
idlesnd = self.metadata.Interior.Sounds.Idle[1].path
end

if not idlesnd then return end


TARDIS:CreateSoundDummyPropIdle(self)

TARDIS:DelocalizedIdleSound(self, idlesnd)

TARDIS:HandleDelocalizedIdleSound(self, idlesnd)

end)


function TARDIS:CreateSoundDummyPropIdle(self) -- create a 'carrier' that houses the sound and allows it to move



    if not self.sndpropdumyidle then
            self.sndpropdumyidle = ents.CreateClientProp("models/props_junk/PopCan01a.mdl")
            self.sndpropdumyidle:SetNoDraw(true)
            self.sndpropdumyidle:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
            self.sndpropdumyidle:SetMoveType(MOVETYPE_NONE)
            self.sndpropdumyidle:SetPos(self.interior:GetPos()) -- put it into the interior
    end

end


function TARDIS:DelocalizedIdleSound(self, idlesnd)

self.interior:StopSound(idlesnd)  -- stop the original idlesound to make sure the it doesnt play twice

        if not self.sndpropdumyidle.idlesounddelocal then
        self.sndpropdumyidle.idlesounddelocal = CreateSound(self.sndpropdumyidle, idlesnd) -- create the sound entity
        self.sndpropdumyidle.idlesounddelocal:ChangeVolume(0,0)
        end


end


function TARDIS:HandleDelocalizedIdleSound(self, idlesnd) -- handle logic for the sound entity

    local inside = LocalPlayer():GetTardisData("interior")
    local open = self:DoorOpen(true)
    local poweron = self:GetPower()


    if inside then
    self.sndpropdumyidle:SetPos(self.interior:GetPos())
    self.sndpropdumyidle.idlesounddelocal:Play()
    self.sndpropdumyidle.idlesounddelocal:ChangeVolume(1,0)
    else
    self.sndpropdumyidle:SetPos(self:GetPos())
    self.sndpropdumyidle.idlesounddelocal:ChangeVolume(0.3,0)
    end


    if not inside then
        if open then
        self.sndpropdumyidle.idlesounddelocal:Play()
        self.sndpropdumyidle.idlesounddelocal:ChangeVolume(0.3,0)
        else
        self.sndpropdumyidle.idlesounddelocal:ChangeVolume(0,0)
        end
    end


    if not poweron then
    self.sndpropdumyidle.idlesounddelocal:ChangeVolume(0,0)
    end

end


ENT:AddHook("OnRemove", "CleanupExtIdle", function(self)
    if IsValid(self.sndpropdumyidle) then
        self.sndpropdumyidle.idlesounddelocal:Stop()
        self.sndpropdumyidle:Remove()
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



