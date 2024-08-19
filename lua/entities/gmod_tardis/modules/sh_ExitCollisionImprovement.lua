if CLIENT then return end

function TARDIS:OrientationCheck(self, var, dir)

    local orientation = dir or self:GetForward()

    local variance = var or 40

    local upcheck = math.acos(orientation:Dot(Vector(0,0,1))) * (180 / math.pi)

    if upcheck < variance then return true
    else return false
    end

end

-- function TARDIS:FacingDownCheck(self, var)

--     local orientation = self:GetForward()*-1

--     local variance = var or 40

--     local upcheck = math.acos(orientation:Dot(Vector(0,0,1))) * (180/math.pi)

--     if upcheck < variance then return true
--     else return false
--     end

-- end

ENT:AddHook("PlayerExit", "ExitFixer", function(self, ply)  -- disable some collisions on player exit to allow for more arbitrary exit angles
                                                            -- also account for extreme cases where the tardis faces door-up or door-down

    if GetConVar("TARDIS_NewStuckSystem"):GetBool() == true then

    if TARDIS:OrientationCheck(self, 40, self:GetForward() * -1) then  -- make sure the player doesnt get stuck if the tardis is laying door-to-floor
    ply:SetPos(self:GetPos() + Vector(0,0,30) + self:GetRight() * 80 + self:GetUp() * 60)  -- all of this just means slightly to the right without getting stuck
    ply:DropToFloor()
    end                                   -- this doesnt work when exiting by pressing ALT + E - why?

    if TARDIS:OrientationCheck(self, 40, self:GetRight()) then  -- same as above but when laying on the side
    ply:SetPos(self:GetPos() + Vector(0,0,30) + self:GetForward() * 60 + self:GetUp() * 20)
    ply:DropToFloor()
    end

    if TARDIS:OrientationCheck(self, 40, self:GetRight() * -1) then  -- same as above but when laying on the side
    ply:SetPos(self:GetPos() + Vector(0,0,30) + self:GetForward() * 60 + self:GetUp() * 20)
    ply:DropToFloor()
    end

        self:SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR)

        if TARDIS:OrientationCheck(self, 40, self:GetForward()) then

            if IsValid(self.parts.stephelper2) then

            self.parts.stephelper2:SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR)
            self.parts.stephelper:SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR)

            end

            ply:SetVelocity(self:GetForward() * 300 + self:GetUp() * -50)

        end

        if TARDIS:OrientationCheck(self, 40, self:GetForward()) == false then  -- make sure player doesnt get stuck if tardis is laying door up
            if IsValid(self.parts.stephelper2) then  -- if stephelper not present, assume this extension is unmodified and dont snap to ground

                if ply:OnGround() == true then  -- dont apply if player is in the air, like after jumping

                ply:SetPos(ply:GetPos() + Vector(0,0,5))  -- move up a few units to make sure the player can never get stuck in the stephelper

                ply:DropToFloor()  -- snap to floor to make the process seamless

                end

            end
        end

        timer.Simple(1, function()

            if IsValid(self) then
            self:SetCollisionGroup(0)

                if IsValid(self.parts.stephelper2) then
                self.parts.stephelper2:SetCollisionGroup(0)
                self.parts.stephelper:SetCollisionGroup(0)
                end

            self:SecondaryStuck(self, ply)
            end

        end)

    end

end)


function ENT:SecondaryStuck(self, ply)

    if not IsValid(self.interior) then return end  -- tacked on to stop errors when no interior mode is enabled

    if GetConVar("TARDIS_NewStuckSystem"):GetBool() == true then

            if ply:GetMoveType() == MOVETYPE_NOCLIP then return false end
            local pos = ply:GetPos()
            local td = {}
            td.start = pos
            td.endpos = pos
            td.mins = ply:OBBMins()
            td.maxs = ply:OBBMaxs()
            td.filter = {ply,self.interior.stuckfilter}
            local tr = util.TraceHull(td)

                if tr.Hit then
                    if ply:GetTardisData("interior") then
                    ply:SetPos(self.interior:LocalToWorld( self.interior.Fallback.pos))
                    else
                    ply:SetPos(self:LocalToWorld( self.exterior.Fallback.pos))
                    end
                end
    end
end


ENT:AddHook("PlayerEnter", "EnterFixer", function(self, ply)  -- same as above but when walking in

    if GetConVar("TARDIS_NewStuckSystem"):GetBool() == true then

        if not IsValid(self.interior) then return end

        if TARDIS:OrientationCheck(self, 40, self:GetForward() * -1) then    -- make sure the player doesnt get stuck if the tardis is laying door-to-floor
        ply:SetPos(self.interior:LocalToWorld( self.interior.Fallback.pos))  -- if the player enters with the door down they appear behind the interior portal for some reason*
        ply:SetLocalVelocity(self.interior:GetForward() * 300)                 -- for some reason the player gets negative velocity when jumping in from below
        end                                                                 -- *instantly setting them to the fallback fixes that

        if TARDIS:OrientationCheck(self, 40, self:GetRight()) then
        ply:SetPos(self.interior:LocalToWorld( self.interior.Fallback.pos))
        ply:SetLocalVelocity(self.interior:GetForward() * 100)
        end

        if TARDIS:OrientationCheck(self, 40, self:GetRight() * -1) then
        ply:SetPos(self.interior:LocalToWorld( self.interior.Fallback.pos))
        ply:SetLocalVelocity(self.interior:GetForward() * 100)
        end

        if TARDIS:OrientationCheck(self, 40, self:GetForward()) then
            timer.Simple(0.01, function()
            ply:SetLocalVelocity(self.interior:GetForward() * 300)
            end)
        end


            if ply:OnGround() == true then

            ply:SetPos(ply:GetPos() + Vector(0,0,5))

            ply:DropToFloor()

            end

        timer.Simple(1, function()

            if IsValid(self) then


            self:SecondaryStuck(self, ply)

            end
        end)

    if IsValid(self.interior) then
        if IsValid(self.interior.parts) then
            if IsValid(self.interior.parts.tardis2010_doorframe) then
                self.interior.parts.tardis2010_doorframe:SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR) -- quick fix for the 2010 extension's doorframe because it is a seperate part from the door
                                                                                                        -- todo: make this metadata so it can work with other extensions if needed
                timer.Simple(1, function()                                                                -- but i cant figure out how to tag a specific part inside of metadata

                        self.interior.parts.tardis2010_doorframe:SetCollisionGroup(0)

                end)
            end
        end
    end

    end
end)







-- ENT:AddHook("PlayerExit", "ExitFixer", function(self, ply)  -- disable some collisions on player exit to allow for more arbitrary exit angles

--     local realcollisionstep  -- has to be here because defining local realcollisionstep on the line that gets the collision group fucks up??

--     local realcollision = self:GetCollisionGroup()  -- gets exterior collision group
--         if IsValid(self.parts.stephelper2) then
--         realcollisionstep = self.parts.stephelper2:GetCollisionGroup()  -- get collision group of stephelper when present
--         end

--     self:SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR)

-- --         if not self.exterior.Portal.exit_point_offset then
-- --             if IsValid(self.parts.stephelper2) then
-- --             self.parts.stephelper2:SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR)
-- --             end
-- --         end

--             if IsValid(self.parts.stephelper2) then

--                 if ply:OnGround() == true then

--                 ply:SetPos(ply:GetPos() + Vector(0,0,5))

--                 ply:DropToFloor()

--                 end

--             end

--         timer.Simple(1, function()

--             if IsValid(self) then
--             self:SetCollisionGroup(realcollision)

-- --                 if IsValid(self.parts.stephelper2) then
-- --                 self.parts.stephelper2:SetCollisionGroup(realcollisionstep)
-- --                 end

--             self:SecondaryStuck(self, ply)
--             end

--         end)

-- end)


ENT:AddHook("Think", "LetPlayerFallIn", function(self)

    local plyvert = self:GetCreator():GetPos() - Vector(0,30,0)

    if TARDIS:OrientationCheck(self, 40, self:GetForward()) and plyvert.z > self:GetPos().z and ((self:GetCreator():GetVelocity().z * -1) > 100) then

        self:SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR)
        if IsValid(self.parts.stephelper2) then
        self.parts.stephelper2:SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR)
        self.parts.stephelper:SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR)
        end

    end

    if plyvert.z < self:GetPos().z then
        self:SetCollisionGroup(0)
        if IsValid(self.parts.stephelper2) then
        self.parts.stephelper2:SetCollisionGroup(0)
        self.parts.stephelper:SetCollisionGroup(0)
        end
    end

end)
