local PART={}
PART.ID = "stephelper_plastic"
PART.Name = PART.ID
PART.Model = "models/hunter/plates/plate05x1.mdl"
PART.AutoSetup = true
PART.Collision = true
PART.ShouldTakeDamage = true


    function PART:Initialize()
                self:SetParent(self.parent)
                self:SetNoDraw(false)
                end

if SERVER then
	function PART:Draw()
		self:DrawModel()
	end
end

TARDIS:AddPart(PART)

local PART={}
PART.ID = "stephelper2_plastic"
PART.Name = PART.ID
PART.Model = "models/hunter/plates/plate05x1.mdl"
PART.AutoSetup = true
PART.Collision = true
PART.ShouldTakeDamage = true


    function PART:Initialize()
                self:SetParent(self.parent)
        		self:SetNoDraw(false)
                end

if SERVER then
	function PART:Draw()
		self:DrawModel()
	end
end

TARDIS:AddPart(PART)
