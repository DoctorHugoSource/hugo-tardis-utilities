local PART={}
PART.ID = "chronoplasmicshell"
PART.Name = PART.ID
PART.Model = "models/hunter/misc/shell2x2.mdl"
PART.AutoSetup = true
PART.Collision = false
PART.ShouldTakeDamage = false
PART.CollisionUse = false
PART.NoShadow = true


function PART:Initialize()
    self:SetParent(self.parent)
    self:SetMaterial("models/props_combine/combine_interface_disp")
    self:SetColor(Color(29, 21, 0))
    self:SetNoDraw(false) -- debugging

    if CLIENT then
    self:SetRenderBounds(Vector(-700,-700,-700), Vector(700,700,700))
    end

end


TARDIS:AddPart(PART)
