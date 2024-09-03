
    ENT:AddHook("PreDrawPart","vortexlighting",function(self,part)  -- set the ambient lighting in vortex

        if not IsValid(self) then return end

        if not IsValid(self.interior) then return end

        if TARDIS:GetExteriorEnt() == self or self:GetData("VortexEVA",false) then  -- checks

        local enabled = self:GetData("vortex",false)  -- enable when in vortex

        local mv = self.interior.metadata.Interior.WindowTint

        if mv == nil then return end

        if self:GetData("CustomVortexEnabled",false) == true then  -- if vortex swapped then use the custom vortex's data
        acol = self:GetData("VortexAmbientColor",nil)
        else
        acol = mv.Extambient  -- else use the extension's default vortex
        end

      render.SuppressEngineLighting(enabled)

      if not acol then return end

        pcol = acol:ToVector() / 255  -- divided by 255 because color values are 0-255, but ResetModelLighting demands values from 0-1

        if GetConVar("tardis2_debug"):GetBool() == true then
        pcol = Color(73,138,199):ToVector() / 255  -- for debugging, exterior ambient light color
        end

        acol = pcol:ToColor()

--             acol = Color(71, 30, 77)  -- debugging  -- old and doesnt work anymore?? i dont even remember why, dude am i just stoned or something

      render.ResetModelLighting(acol.r, acol.g, acol.b)

        end
    end)


    function TARDIS:ApplyExteriorWindowTint(self)

    local proxymd = self.interior.metadata.Interior.TintProxies_Ext
    local proxymddoor = self.interior.metadata.Interior.TintProxies_ExtDoor
    local proxymddoorint = self.interior.metadata.Interior.TintProxies_ExtDoorInt
    local door = self.parts.door
    local intdoor = self.interior.parts.door

        for index, mat in pairs (proxymd) do
        self:SetSubMaterial(index, mat)
        end

        for index, mat in pairs (proxymddoor) do
        door:SetSubMaterial(index, mat)
        end

        for index, mat in pairs (proxymddoorint) do
        intdoor:SetSubMaterial(index, mat)
        end

    end

    function TARDIS:UnApplyExteriorWindowTint(self)

    if not IsValid(self.interior) then return end

    local proxymd = self.interior.metadata.Interior.TintProxies_Ext
    local proxymddoor = self.interior.metadata.Interior.TintProxies_ExtDoor
    local proxymddoorint = self.interior.metadata.Interior.TintProxies_ExtDoorInt
    local door = self.parts.door
    if not istable(self.interior.parts) then return end
    local intdoor = self.interior.parts.door

        for index, mat in pairs (proxymd) do
        self:SetSubMaterial(index, "")
        end

        for index, mat in pairs (proxymddoor) do
        door:SetSubMaterial(index, "")
        end

        for index, mat in pairs (proxymddoorint) do
        intdoor:SetSubMaterial(index, "")
        end

    end


ENT:AddHook("StopDemat", "vortexexttint", function(self)  -- apply the matproxy materials when in vortex for window tint

--     local dt = 0.5
--
--     if self:GetFastRemat() then
--     dt = 1
--     end

    if self:GetFastRemat() then return end

    timer.Simple(1, function()

        if self.interior then

        if not self.interior.parts then return end

            TARDIS:ApplyExteriorWindowTint(self)

        end
    end)
end)



ENT:AddHook("MatStart", "vortexexttint", function(self)  -- revert material back to default after leaving vortex

        if IsValid(self) then
            TARDIS:UnApplyExteriorWindowTint(self)
        end
end)




    ENT:AddHook("PreDrawPart","improvedvortex",function(self,part)
        if not (part and part.ID=="vortex") then return end
        local target = self:GetData("vortex") and 1 or 0
        local vortexalpha = (((self:GetData("alpha",0)/255) - 1) * -1) or self:GetData("vortex") and 1
        local enabled = self:IsVortexEnabled() or (LocalPlayer():GetTardisData("thirdperson") == true and self:GetData("teleport")) or (self:GetFastRemat() and self:GetData("vortex"))
        if (TARDIS:GetExteriorEnt()==self or self:GetData("VortexEVA",false)) and enabled then
            if self:GetHandbrake() then
            self:SetData("alpha",255,true)
            -- part:SetModelScale(0,0)
            end
            if not (self:GetData("teleport") or self:GetData("vortex")) then
            self:SetData("alpha",255,true)
            -- part:SetModelScale(0,0)
            end
            render.SetBlend(vortexalpha * vortexalpha)
            -- part:SetModelScale(5,0)
            if vortexalpha>0 and self:CallHook("ShouldVortexIgnoreZ") then
                cam.IgnoreZ(true)
                part:SetModelScale(5,0)
            end
        else
            render.SetBlend(0)
            part:SetModelScale(0,0) -- experimental; for some reason disabling the vortex's shadow rendering doesnt work under some conditions, but making the model tiny does
        end
    end)



    ENT:AddHook("OnRemove", "tba", function(self)

    end)



-- ENT:AddHook("Think","vortexrenderfix",function(self)
-- if SERVER then
--
-- self.parts.vortex:SetPos(self:GetPos())
--
-- end
-- end)
--
--
-- ENT:AddHook("PreDrawPart","vortexrenderfix",function(self,part)
--
--
--
--     if not (part and part.ID=="vortex") then return end
--
--
--     local enabled = self:GetData("vortex",false)
--     if enabled then
--         render.SetBlend(1)
--          self:SetData("vortexalpha",255)
--         if self:CallHook("ShouldVortexIgnoreZ") then
--             cam.IgnoreZ(true)
--         end
--     else
--         render.SetBlend(0)
--         self:SetData("vortexalpha",0)
--     end
-- end)
--
--
--     ENT:AddHook("PostDrawPart","vortexrenderfix",function(self,part)
--         if not (part and part.ID=="vortex") then return end
--         render.SetBlend(1)
--             cam.IgnoreZ(false)
--
--     end)



--     ENT:AddHook("PreDrawPart","occlusionrenderfix",function(self,part)
--
--     if not (part and part.ID=="occluder") then return end
--
--         render.SetBlend(0)
--         part.o.Draw(part)
--         render.SetBlend(1)
--
-- end)
--
--     ENT:AddHook("PreDrawPart","occlusionrenderfixw",function(self,part)
--
--     if not (part and part.ID=="dooroccluder") then return end
--
--         render.SetBlend(0)
--         part.o.Draw(part)
--         render.SetBlend(1)
--
-- end)


















