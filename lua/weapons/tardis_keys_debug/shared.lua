AddCSLuaFile()

SWEP.Spawnable = true
SWEP.PrintName = "TARDIS Keys debug"
SWEP.Category = "Doctor Who - TARDIS"
SWEP.Author = "Gallifrey Black Hole Shipyard"
SWEP.AdminOnly = false
SWEP.UseHands = true

SWEP.Purpose = "Your personal TARDIS keys"
SWEP.Base = "weapon_base"

SWEP.ViewModel				= "models/molda/sonics/keysonic/c_keysonic.mdl"
SWEP.WorldModel				= "models/molda/sonics/keysonic/w_keysonic.mdl"
SWEP.ViewModelFOV		= 95


SWEP.Primary.Delay = 1
SWEP.Primary.ClipSize = 0
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""

SWEP.Secondary.ClipSize = 0
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

SWEP.Weight = 0
SWEP.AutoSwitchTo = true
SWEP.AutoSwitchFrom = false

SWEP.Slot = 0
SWEP.SlotPos = 0
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true

-- List this weapon in the store
-- local tardiskeys_test2 = jstore.Register(SWEP, 10, { type = "tool" })






----------------------------------------------------------------------------------------------------------------------------------------------

-- abandon all hope ye who enter here
-- below is like a thousand lines of throaway code used for debugging and i kept all of it

----------------------------------------------------------------------------------------------------------------------------------------------

function SWEP:PrimaryAttack()


    print (util.QuickTrace(Entity(1):GetPos(), Vector(0,0,-100) ).Hit)




-- if CLIENT then return end
--     jazztardis:SetData("jazz_destination", "jazz_bar", true)
--     print (jazztardis:GetData("jazz_destination", nil))

-- local ent = (self:GetOwner():GetEyeTrace().Entity)
-- ent:SetLightingOriginEntity(jazztardis.parts.door)
-- print (ent:GetLightingOriginEntity())



-- require("niknaks")
-- NikNaks() -- Everything after this line, don't need "NikNaks." infront.


-- bspobject = NikNaks.CurrentMap

-- print (BSPObject:GetEntities())

-- testsndscape = CurrentMap:FindByClass("env_soundscape")


-- if IsValid(serverside_projectedtexture) then
-- serverside_projectedtexture:SetKeyValue("lightfov", 100)
-- else
--
-- serverside_projectedtexture = ents.Create("env_projectedtexture")
--
-- serverside_projectedtexture:SetKeyValue("lightfov", 100)
-- serverside_projectedtexture:SetKeyValue("farz", 1000)
-- serverside_projectedtexture:SetKeyValue("texturename", jazztardis.metadata.Exterior.ProjectedLight.texture)
--
-- -- PrintTable(jazztardis.intprojectedlight:GetKeyValues())
--
--
-- serverside_projectedtexture:SetPos(self:GetOwner():GetShootPos() + self:GetOwner():EyeAngles():Forward()*50)
-- end
--
--
-- AddOriginToPVS( self:GetOwner():GetShootPos() )




-- local proxymd = jazztardis.interior.metadata.Interior.TintProxies
--
-- for k, v in pairs (proxymd) do
--
-- print (k)
-- end


-- local ply = self:GetOwner()
--
-- local oldpos = ply:GetPos()
--
-- ply:SetPos(Vector(0,0,0))
--
-- if IsValid(self) then
-- ply:SetPos(oldpos)
-- end


-- local col = render.GetLightColor( jazztardis:GetPos() )
--
-- print (col)
--
-- local ply = self:GetOwner()
--
-- -- local intpos = jazztardis.interior:GetPos()
-- local wint = jazztardis.interior:WorldToLocal(ply:GetPos())
--
-- local wintstr = tostring(wint)
--
--     file.Write ("tardis_stats_plyposition.txt", wintstr )

-- local plyintpos = ply:GetPos() - intpos


-- jazztardis:ApplyStats()

end

----------------------------------------------------------------------------------------------------------------------------------------------

function SWEP:SecondaryAttack()

StormFox2.Time.Set(StormFox2.Time.Get() + 360)

-- print(StormFox2.Time.Get())


-- if CLIENT then return end
--     print (jazztardis:GetData("jazz_destination", nil))


-- print (Vector(0,1,0) * 100)







--     local selfpos = self:GetOwner():GetPos()

--     local comp = 0

-- local trace1 = util.QuickTrace(selfpos, Vector(0,99999,0), Entity(1))
-- local trace2 = util.QuickTrace(selfpos, Vector(0,-99999,0), Entity(1))
-- local trace3 = util.QuickTrace(selfpos, Vector(99999,0,0), Entity(1))
-- local trace4 = util.QuickTrace(selfpos, Vector(-99999,0,0), Entity(1))

-- local returnedlengths = {
--     trace1.HitPos,
--     trace2.HitPos,
--     trace3.HitPos,
--     trace4.HitPos
-- }

-- local lowest = 99999
-- local closewall

-- for k, v in pairs(returnedlengths) do

--     length = selfpos:Distance(v)

--         if length < lowest then
--         lowest = length
--         closewall = v
--         end

-- end





-- for k, v in pairs (testsndscape) do

-- if v["soundscape"] == "construct.outside" then

-- print (v["soundscape"])

-- local bad = v["soundscape"]

-- PrintTable (sound.GetTable())

-- for d, f in pairs (ents.FindByClass("env_soundscape")) do

-- f:StopSound("construct.outside")
-- end
-- end
-- end
-- serverside_projectedtexture:SetKeyValue("lightfov", 1)

-- local env_tardisscape = ents.Create("env_soundscape")

-- for k, v in pairs (ents.FindByClass("env_soundscape")) do
--
-- v:SetKeyValue("radius", 1)
-- PrintTable (v:GetKeyValues())
-- end



-- env_tardisscape:SetKeyValue("soundscape", "Nothing")
-- env_tardisscape:SetKeyValue("radius", 1000)
--
-- env_tardisscape:Spawn()
-- env_tardisscape:Activate()
--
-- PrintTable(env_tardisscape:GetKeyValues())
--
--
-- env_tardisscape:SetPos(self:GetOwner():GetShootPos() + self:GetOwner():EyeAngles():Forward()*50)
-- env_tardisscape:Fire("Enable")
-- env_tardisscape:Fire("ToggleEnabled")



-- local ply = self:GetOwner()
--
-- local wintpos = file.Read ("tardis_stats_plyposition.txt", DATA)
--
-- local wintposnum = Vector(wintpos)
--
-- ply:SetPos(jazztardis.interior:LocalToWorld(wintposnum))
-- local ply = self:GetOwner()
-- local hadns = ply:GetHands()
--
--  local originalmat2 = hadns:GetSubMaterial(1)
--
--
-- local originalmat = originalmat2:GetTexture("$basetexture")
--
-- print(originalmat)

-- local xyt = tobool  ( file.Read ("tardis_stats_maptransited.txt", DATA ) )
--
-- print (xyt)
--
-- if xyt == true then
-- self:GetOwner():Kill()
-- end
end

----------------------------------------------------------------------------------------------------------------------------------------------

function SWEP:Reload()    -- call tardis to your location, like the sonic can - but shortcut


self:GetOwner():DropToFloor()

-- local ply = self:GetOwner()
-- TARDISspawn(ply)
--             file.Write ("tardis_stats_maptransited.txt", "true" )

-- serverside_projectedtexture:Remove()
-- for k, v in pairs (ents.FindByClass("env_soundscape")) do
--
--
--
-- PrintTable (v:GetKeyValues())
--
--
--
-- end
-- print ( jazztardis:GetBodygroup(0) )
--
--
--     local bodygrnum = tonumber ( jazztardis:GetBodygroup(0) )
-- print (bodygrnum)
-- print (jazztardis:GetSkin())
-- jazztardis:SetSkin(1)
-- if SERVER then
-- local ply = self:GetOwner()
-- local hadns = ply:GetHands()
--
--
--
--
--
-- local originalmat = hadns:GetSubMaterial(1)
--
--
--
--
--
-- local tardisvmshade = CreateMaterial("shadedvm", "VertexLitGeneric", d)
--
--
--
--
--
--
--
--
--
-- local dark = Color(100, 100, 100, 100)
--
--
-- ply:GetHands():SetColor(dark)
--
-- ply:GetHands():SetSubMaterial(1, "phoenix_storms/metalset_1-2")
--
-- ply:GetHands():SetRenderMode( RENDERMODE_TRANSCOLOR )
--
-- print ( ply:GetHands():GetColor()  )







end














----------------------------------------------------------------------------------------------------------------------------------------------
