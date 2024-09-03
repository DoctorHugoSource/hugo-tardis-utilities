-- debug entity, not to be used, will be removed when it isnt 2 am
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")


function ENT:Initialize()
    self:SetModel("models/props_c17/lamp001a.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)

    self:SetName("cmbtarget")
    self:SetColor(Color(255, 255, 255, 255))
    self:SetUseType(SIMPLE_USE)

    local phys = self:GetPhysicsObject()

    if phys:IsValid() then
        phys:Wake()
    end


end

if SERVER then

function ENT:Think()



for k, v in ipairs(ents.FindByClass("npc_combine_s")) do

    if v:IsValid() and v:IsNPC() and v:Classify() and v:GetNPCState() and v:GetNPCState() != NPC_STATE_DEAD then

        v:AddEntityRelationship( self, D_HT, 99 )
        v:UpdateEnemyMemory( self, self:GetPos() )





            if not v:GetEnemy() or (v:GetEnemy() and not v:GetEnemy():IsValid()) then

                v:SetEnemy(self)
                v:SetSchedule( SCHED_RANGE_ATTACK1 )
                print ("ddd")
            end




    end

end

end


end
