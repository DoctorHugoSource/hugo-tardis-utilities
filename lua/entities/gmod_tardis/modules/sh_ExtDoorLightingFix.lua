
if CLIENT then


local function predraw_ode (self, part)  -- okay so this is a bunch of junk code to try and fix the disparity between exterior and interior door lighting

    if not (part and part.ID == "door") then return end

render.SetLightingOrigin(self:GetPos())

end


ENT:AddHook("PreDrawPart", "customlighting3", predraw_ode)

ENT:AddHook("PostDrawPart", "customlighting3", predraw_ode)

end