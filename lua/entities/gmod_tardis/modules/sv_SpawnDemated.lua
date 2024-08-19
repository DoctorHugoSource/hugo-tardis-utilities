
ENT:AddHook("CustomData", "SpawnDemated", function(self, customData)

    if customData.spawndemated then
        self:SetData("spawn_in_vortex", true)
    end
end)

----------------------------------------------------------------------------------------------------------------------------------------------

ENT:AddHook("PostInitialize", "SpawnDemated", function(self)


if not self:GetData("spawn_in_vortex") then return end

    self:ForceDematState()
--     local snd = GetSpawnDeleteSound(id, true)
--     snd:Stop()

        self:Timer("spawndemated_materialize", 2, function()

            local phys = self:GetPhysicsObject()
            if IsValid(phys) then
                phys:Wake()
            end

            self:Mat()

                if IsValid(jazztardis) then
                jazztardis:ApplyStats()
                end

            self:SetData("spawn_in_vortex", false)


            if self.parts.occluder then
            self.parts.occluder:SetNoDraw(false)
            self.parts.dooroccluder:SetNoDraw(false)
            self:SetColor (Color (255, 255, 255, 254))
            self:SetRenderMode(1)
            self.parts.door:SetColor (Color (255, 255, 255, 254))
            self.parts.door:SetRenderMode(1)
            end

        end)
end)


----------------------------------------------------------------------------------------------------------------------------------------------
