
ENT:AddHook("DematStart", "TardisUtilMapchangeWarning", function(self)       -- CanDemat

    local ply = self:GetCreator()

    if self:GetMapTravel() then

        if self:GetTargetMap() ~= nil then

            TARDIS:Message(ply, "WARNING: Map transition imminent!")

            self:SaveStats()
        end
    end
end)




