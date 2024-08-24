if SERVER then

ENT:AddHook("Think", "CombineInteractions", function(self)  -- alerts the combine to the tardis' presence, instantly making it anticitizen #1

    if self:GetCloak() then return end  -- cloak has a use now; you can sneak through combine forces
    if self:IsDead() then return end  -- no use attacking what's dead

for k, v in ipairs(ents.FindByClass("npc_combine_s")) do

    if v:GetPos():Distance(self:GetPos()) > 5000 then return end

    if v:IsValid() and v:IsNPC() and v:Classify() and v:GetNPCState() and v:GetNPCState() != NPC_STATE_DEAD then

        v:AddEntityRelationship( self, D_HT, 0 )    -- makes combine hate the tardis
        v:UpdateEnemyMemory( self, self:GetPos() )  -- alerts soldiers to the tardis' location


            if not v:GetEnemy() or (v:GetEnemy() and not v:GetEnemy():IsValid()) then  -- if the soldier currently does not have an enemy set

                v:SetEnemy(self)                    -- set tardis as the current enemy
                v:SetSchedule( SCHED_RANGE_ATTACK1 )

            end

                if v:GetCurrentSchedule() == 12 then     -- this schedule is active when the soldier gets in position to fire

                    if not IsValid(cmb_tdg) then
                        v:SetSaveValue( "m_vecLastPosition", self:GetPos() )
                        v:SetSchedule( SCHED_FORCED_GO )
                    else


                    v:SetSchedule( SCHED_RANGE_ATTACK1 ) -- this makes the soldier fire at the tardis
                    end
                end




                if v:GetPos():Distance(self:GetPos()) < 150 then

                    if not IsValid(cmb_tdg) then

                    cmb_tdg = ents.Create("gmod_time_distortion_generator")

                    cmb_tdg:SetPos(v:GetPos() + Vector(0, 0, 30) + v:GetForward() * 50)
                    cmb_tdg:Spawn()
                    cmb_tdg:SetModel("models/combine_turrets/floor_turret_gib3.mdl")
                    cmb_tdg:Use(v)
                    cmb_tdg:SetCollisionGroup(COLLISION_GROUP_DEBRIS)

                    end

                end

    end

end

end)

end