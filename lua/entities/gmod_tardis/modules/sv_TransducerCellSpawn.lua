
ENT:AddHook("PostInitialize", "addtransducercell", function(self)

    if not IsValid(self.interior) then return end

    if self.metadata.Interior.TransducerCell == nil then return end

        self:Timer("transcell_spawn", 1, function()

            self.jazzcell = ents.Create("transducer_cell")
            self.jazzcell:Spawn()
            if IsValid(self.jazzcell:GetPhysicsObject()) then
                self.jazzcell:GetPhysicsObject():Wake()
            end

            if not IsValid(self.interior) then return end -- why does this require a second isvalid check??

            self.jazzcell:SetPos(self.interior:LocalToWorld(self.metadata.Interior.TransducerCell.position))

        end)
end)


ENT:AddHook("OnRemove", "RemoveTransCell", function(self)
    if IsValid(self.jazzcell) then
        self.jazzcell:Remove()
    end
end)