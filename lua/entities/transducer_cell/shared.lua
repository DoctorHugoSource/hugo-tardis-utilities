

ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Transducer Cell"
ENT.Spawnable = true

ENT.Instructions= "Sacrifice your life energy to jumpstart a broken TARDIS"
ENT.AdminOnly = false
ENT.Category = "#TARDIS.Spawnmenu.CategoryTools"
ENT.IconOverride = "materials/entities/time_distortion_generator.png"


function ENT:SetupDataTables()
    self:NetworkVar( "Bool", 1, "Enabled" )
end
