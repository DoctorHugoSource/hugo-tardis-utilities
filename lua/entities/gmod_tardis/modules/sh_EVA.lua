if SERVER then


ENT:AddHook("PostInitialize", "EVA", function(self)

self:ToggleEVA()

end)



ENT:AddHook("PlayerExit", "EVA", function(self, ply)

    if self:GetData("vortex") then
    self:SetData("VortexEVA",true,true)
    self:SetCollisionGroup(COLLISION_GROUP_NONE)
    self:UpdateShadow()
    self:SetSolid(SOLID_VPHYSICS)

    end


end)



ENT:AddHook("PlayerEnter", "EVA", function(self, ply)

    if self:GetData("vortex") then
    self:SetData("VortexEVA",false,true)
    self:SetCollisionGroup(COLLISION_GROUP_WORLD)
    self:SetSolid(SOLID_NONE)

    end


end)


ENT:AddHook("ShouldTurnOffFlightSound", "eva", function(self)
    if self:GetData("VortexEVA",false) then
        return false
    end
end)


ENT:AddHook("ShouldVortexIgnoreZ", "eva", function(self)
--         if self:GetData("VortexEVA",false) then
--             return true
--         end
end)

--     ENT:AddHook("PreDrawPart","EVAvortex",function(self,part)
--         if not (part and part.ID=="vortex") then return end
--         local target = self:GetData("vortex") and 1 or 0
--         local vortexalpha = self:GetData("vortexalpha",0)
--         local enabled = self:GetData("VortexEVA",false)
--         if enabled then
--             render.SetBlend(vortexalpha)
--             if vortexalpha>0 and self:CallHook("ShouldVortexIgnoreZ") then
--                 cam.IgnoreZ(true)
--             end
--         else
--             render.SetBlend(0)
--         end
--     end)




    function ENT:GetEVA()
        return self:GetData("EVA",false)
    end



    function ENT:SetEVA(on)
        self:SetData("EVA",on,true)
        return true
    end



    function ENT:ToggleEVA()
        local on = not self:GetEVA()
        return self:SetEVA(on)
    end


--

    function ENT:GetVortexEVA()
        return self:GetData("VortexEVA",false)
    end



    function ENT:SetVortexEVA(on)
        self:SetData("VortexEVA",on,true)
        return true
    end



    function ENT:ToggleVortexEVA()
        local on = not self:GetVortexEVA()
        return self:SetVortexEVA(on)
    end

end
