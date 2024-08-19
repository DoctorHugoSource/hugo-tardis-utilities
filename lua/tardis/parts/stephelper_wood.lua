local PART={}
PART.ID = "stephelper"
PART.Name = PART.ID
PART.Model = "models/props_phx/construct/wood/wood_panel1x1.mdl"
PART.AutoSetup = true
PART.Collision = true
PART.ShouldTakeDamage = true
PART.NoShadowCopy = true


    function PART:Initialize()
                self:SetParent(self.parent)
                self:SetNoDraw(true)
                if GetConVar("tardis2_debug"):GetBool() == true then
                self:SetNoDraw(false)  -- for debugging
                end
                end

if SERVER then
	function PART:Draw()
		self:DrawModel()
	end
end

TARDIS:AddPart(PART)

local PART={}
PART.ID = "stephelper2"
PART.Name = PART.ID
PART.Model = "models/props_phx/construct/wood/wood_panel1x1.mdl"
PART.AutoSetup = true
PART.Collision = true
PART.ShouldTakeDamage = true
PART.NoShadowCopy = true


    function PART:Initialize()
                self:SetParent(self.parent)
                self:SetNoDraw(true)
                if GetConVar("tardis2_debug"):GetBool() == true then
                self:SetNoDraw(false)  -- for debugging
                end
                end

if SERVER then
	function PART:Draw()
		self:DrawModel()
	end
end

TARDIS:AddPart(PART)
