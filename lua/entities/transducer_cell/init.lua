-- Artron Inhibitor by Nova Astral, an edit of the Time Distortion Generator by parar020100 and JEREDEK

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")


function ENT:Initialize()
    self:SetModel("models/props_c17/lamp001a.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)

    self:SetName("TransducerCell")
    self:SetColor(Color(255, 255, 255, 255))
    self:SetUseType(SIMPLE_USE)

    local phys = self:GetPhysicsObject()




    if phys:IsValid() then
        phys:Wake()
    end


end


function ENT:Use(ply)
if ply:Health() > 50 then
ply:SetHealth(ply:Health() - 50)
else
ply:SetHealth(1)
end
self.Active = true


end

function ENT:Touch(entity)

if not self.Active then return end

    if entity:GetClass() == "gmod_tardis_interior" then
    if entity:GetData("power-state") == true then return end

        local pos = entity:GetPos()
        local curpos = self:GetPos()

        if pos:Distance( curpos ) > 200 then return end

                timer.Simple( 5, function()

                TardisHADSClutch2 = true
                if entity.exterior:GetHealth() == 0 then
                entity.exterior:ChangeHealth(70)
                entity.exterior:SetArtron(10)
                end

                    if entity:GetData("power-state") == false then
                    entity:TogglePower()
                    self.Active = false

                        timer.Simple( 0.2, function()
                        if entity.exterior:GetHADS() then
                        entity.exterior:TriggerHADS()
                        end
                        end)

                    end

                end)

            timer.Simple( 15, function()
            TardisHADSClutch2 = false
            end)

    end

end



