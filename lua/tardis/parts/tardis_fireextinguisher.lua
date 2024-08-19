 
local PART={}
PART.ID = "tardisfireexting"
PART.Name = "Fire Extinguisher"
PART.Model = "models/kleiner_gestures.mdl"
PART.AutoSetup = true
PART.Collision = false
PART.ShouldTakeDamage = false
PART.BypassIsomorphic = true


	local adns = {}

	adns = engine.GetAddons()

for k, v in pairs (adns) do

	if v["title"] == "Fire Extinguisher" then
	PART.ExtingInstalled = true
	end

end

if PART.ExtingInstalled == true then

	PART.Model = "models/weapons/w_fire_extinguisher.mdl"

	if SERVER then

		function PART:Use(ply)


			if ply:HasWeapon("weapon_extinguisher_infinite") then
			ply:StripWeapon("weapon_extinguisher_infinite")
			else

			ply:Give("weapon_extinguisher_infinite")
			ply:SelectWeapon("weapon_extinguisher_infinite")

			end

		end
	end

end
TARDIS:AddPart(PART)

