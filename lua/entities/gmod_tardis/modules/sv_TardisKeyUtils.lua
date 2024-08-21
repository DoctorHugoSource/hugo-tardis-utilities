
ENT:AddHook("StopDemat", "HugoTardisKeyUtil", function(self)

    timer.Simple( 1, function()

        -- remove tardis upon alt fire with tardis keys
        if IsValid(jazztardis) then

            if self:GetDematLeave() then

            jazztardis:SaveStats()
            jazztardis:Remove()

            end

        end
    end)
----------------------------------------------------------------------------------------------------------------------------------------------

    -- move tardis to owner upon hitting reload
    -- if self:GetKeyReposition() then  -- possibly deprecated after i decided to make it use fast remat because it's just less tedious

    --     if IsValid(jazztardis) then

    --         jazztardis:Timer("mattransparencyfix", 0.3, function()  -- necessary because telling the tardis to mat 1 frame after it demat'ed
    --         jazztardis:Mat()                                        -- breaks the fade-in sequence when materializing
    --         self:ToggleKeyReposition()
    --         end)

    --     end
    -- end

end)



ENT:AddHook("StopMat", "HugoTardisKeyUtil", function(self)

if IsValid(jazztardis) then

    local alreadyactive = jazztardis:GetData("keyrecall_alreadyactive", false)

    if self:GetKeyReposition() then

        timer.Simple( 0.3, function()
            if not alreadyactive then  -- 'fast' check to keep fast remat enabled only if it was already active before tardis call
            self:SetFastRemat(false)  -- just here to turn back off fast remat if it was previously enabled by the key
            end

                self:SetData("keyrecall_alreadyactive", false)

        end)
    end

    self:SetKeyReposition(false)

end

end)


----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------


ENT:AddHook("DematStart", "KeyAlerts", function(self)

    if self:GetDematLeave() then

        if not self:GetCreator():GetTardisData("interior") then
        TARDIS:Message(self:GetCreator(), "Phase-Desync initiated. Your TARDIS is leaving")
        end
    end

----------------------------------------------------------------------------------------------------------------------------------------------

    if self:GetKeyReposition() then

        TARDIS:Message(self:GetCreator(), "You've called Your TARDIS to your location")
    end

end)


----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------

--         self:SetMaterial()
--         self:SetSubMaterial()
--         -- reset submaterials etc.
--         self:SetModel(ext_md.Model)
--         self:PhysicsInit(SOLID_VPHYSICS)
--         self:SetMoveType(MOVETYPE_VPHYSICS)
--         self:SetSolid(SOLID_VPHYSICS)
--         self.phys = self:GetPhysicsObject()









--             local extportal = self.interior.portals.exterior
--             local portal_md = ext_md.Portal
--
--             extportal:SetParent(nil)
--             extportal:SetPos(self:LocalToWorld(portal_md.pos))
--             extportal:SetAngles(self:LocalToWorldAngles(portal_md.ang))
--             extportal:SetWidth(portal_md.width)
--             extportal:SetHeight(portal_md.height)
--             extportal:SetThickness(portal_md.thickness or 0)
--             extportal:SetInverted(portal_md.inverted)
--             extportal:SetParent(self)
