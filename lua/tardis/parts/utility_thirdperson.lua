 

local PART={}
PART.ID = "thirdperson_utility"
PART.Name = "Thirdperson Interface"
PART.Model = "models/props_c17/streetsign005b.mdl"
PART.AutoSetup = true
PART.Collision = false
PART.ShouldTakeDamage = true
PART.Control = "thirdperson"

    function PART:Initialize()
                self:SetParent(self.parent)
                self:SetNoDraw(true)  -- set to true for debugging
                end

if SERVER then
	function PART:Draw()
		self:DrawModel()
	end
end

TARDIS:AddPart(PART)
