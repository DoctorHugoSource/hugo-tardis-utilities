
function ENT:SaveStats()
    file.Write ("tardis_stats_artron.txt", self:GetArtron() )
    file.Write ("tardis_stats_health.txt", self:GetHealth() )
    file.Write ("tardis_stats_skin.txt", self:GetSkin() )
    file.Write ("tardis_stats_bodygroup.txt", self:GetBodygroup(0) )
    file.Write ("windowopacity.txt", tostring( self:GetWindowTint() ) )
    file.Write ("chosenvortexenabled.txt", self:GetData("Scheduledvortex", false) )  -- compress these four into one if i can ever figure out how to write a file with more than one value
    file.Write ("chosenvortextintcol.txt", tostring (self:GetData("ScheduledVortexTintColor", Vector(0,0,0))) )
    file.Write ("chosenvortextintcolext.txt", tostring (self:GetData("ScheduledVortexExtColor", Vector(0,0,0))) )
    file.Write ("chosenvortexambientcol.txt", tostring (self:GetData("ScheduledVortexAmbientColor", Vector(0,0,0)):ToVector()) )
    file.Write ("shortmat.txt", tostring (self:GetFastVortexRemat()) )
    file.Write ("vortexindex.txt", tostring (self.vortexindex) )
    file.Write ("timestate.txt", tostring (self:GetData("TimeState", false)) )

end





function ENT:ApplyStats()

local artron = file.Read ("tardis_stats_artron.txt", DATA )
local health = file.Read ("tardis_stats_health.txt", DATA )
local skin = file.Read ("tardis_stats_skin.txt", DATA )
local bodygr = file.Read ("tardis_stats_bodygroup.txt", DATA )
local tinton = file.Read ("windowopacity.txt", DATA )
local vortexenabled = file.Read ("chosenvortexenabled.txt", DATA )
local vortextintcol = file.Read ("chosenvortextintcol.txt", DATA )
local vortextintcolext = file.Read ("chosenvortextintcolext.txt", DATA )
local vortexambient = file.Read ("chosenvortexambientcol.txt", DATA )
local shortmat = file.Read ("shortmat.txt", DATA )
local ind = file.Read ("vortexindex.txt", DATA )
local timestate = file.Read ("timestate.txt", DATA )

local skinnum = tonumber(skin)
local bodygrnum = tonumber (bodygr)
local on = tobool (tinton)
local shorton = tobool (shortmat)
local index = tonumber (ind)
local timeon = tobool (timestate)

self:SetArtron(artron)
self:ChangeHealth(health)
self:SetSkin(skinnum)
self:SetBodygroup(0, bodygrnum)
self:SetData("windowtint",on,true)
self:SetData("Scheduledvortex", vortexenabled, false)
local vortextintcolvec = Vector(vortextintcol)
self:SetData("ScheduledVortexTintColor", vortextintcolvec, false)
local vortextintcolextvec = Vector(vortextintcolext)
self:SetData("ScheduledVortexExtColor", vortextintcolextvec, false)
local vortexambientvec = Vector(vortexambient):ToColor()
self:SetData("ScheduledVortexAmbientColor", vortexambientvec, false)
self:SetFastVortexRemat(shorton)
self.vortexindex = index
self:SetData("TimeState", timeon, true)

end

if CLIENT then return end
