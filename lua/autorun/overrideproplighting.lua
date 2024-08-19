



if SERVER then return end

-- hook.Add("Think", "TARDISPropLighting", function()

--     local vmlocol
--     local int

--     for k, t in pairs (ents.FindByClass("gmod_tardis")) do

--         vmlocol = t.vmlocolprop
--         int = t.interior

--         ApplyTardisPropLO()

--     end

-- local function OverridePropLighting(self)

--     self:DrawModel()

--     if IsValid(int) then

--         local distsqr = 1500 * 1500

--         local enabled = self:GetPos():DistToSqr(int:GetPos()) < distsqr

--             render.SuppressEngineLighting(enabled)

--             if vmlocol == nil then return end          -- dont spew errors if the value is empty

--             render.ResetModelLighting(vmlocol, vmlocol, vmlocol)

--             self:DrawModel()
--     end
-- end

-- function ApplyTardisPropLO()

--     if IsValid(int) then

--         local intprops = ents.FindInSphere(int:GetPos(), 2000)

--         for k, v in pairs(intprops) do

--             if v:GetClass() == "prop_physics" or v:GetClass() == "transducer_cell" then

--             v.RenderOverride = OverridePropLighting

--             end

--         end

--     end
-- end

-- end)





-- if SERVER then

--     util.AddNetworkString( "JazztardisForClient" )

--         hook.Add( "OnEntityCreated", "SendJazzTardis", function( ent )

--             if ent:GetClass() == "gmod_tardis"  then

--             net.Start("JazztardisForClient")
--             net.WriteEntity(ent)

--             net.Broadcast()

--             end

--         end)

-- else



-- net.Receive( "JazztardisForClient", function( len, ply )

-- ClientJazztardis = net.ReadEntity()

-- end )


-- end


-- hook.Add("Think", "TARDISPropLighting", function()

--     for k, t in pairs (ents.FindByClass("gmod_tardis")) do

--         local vmlocol = t.vmlocolprop
--         local int = t.interior

--         ApplyTardisPropLO(int, vmlocol)

--     end

-- function TARDISOverridePropLighting(self, int, vmlocol)

--     self:DrawModel()

--     local distsqr = 1500 * 1500

--     local enabled = self:GetPos():DistToSqr(int:GetPos()) < distsqr

--         render.SuppressEngineLighting(enabled)

--         if vmlocol == nil then return end          -- dont spew errors if the value is empty

--         render.ResetModelLighting(vmlocol, vmlocol, vmlocol)

--         self:DrawModel()

-- end

-- function ApplyTardisPropLO(int, vmlocol)

--     if IsValid(int) then

--         local intprops = ents.FindInSphere(int:GetPos(), 2000)

--         for k, prop in pairs(intprops) do

--             if prop:GetClass() == "prop_physics" then

--             prop.RenderOverride = TARDISOverridePropLighting(prop, int, vmlocol)

--             end

--         end

--     end
-- end

-- end)



-- hook.Add( "SetupPlayerVisibility", "IntLightFix", function( ply, ent )
--
--     if IsValid(Jazztardis) then
--
--         if Jazztardis.interior.parts.door:IsValid() and !Jazztardis.interior.parts.door:TestPVS() then
--             AddOriginToPVS( Jazztardis.interior.parts.door:GetPos() )
--         end
-- 	end
-- end )


-- for k, v in pairs (ents.GetAll()) do
-- print(v)
-- if v:GetClass() == "prop_physics" then
--
-- function v:Draw()
--
--       render.SuppressEngineLighting(true)
--
--       render.ResetModelLighting(0.015, 0.015, 0.015)
--
-- end
-- end
-- end
-- for k, v in pairs (ents.FindByClass("prop_physics")) do
--
--
-- function v:Draw()
--
--       render.SuppressEngineLighting(true)
--
--       render.ResetModelLighting(0.015, 0.015, 0.015)
--
--
-- end
--
--
-- end

-- ENT:AddHook("Draw", "lamps", function(self)
--
--
--
--
-- hook.Add("PreDrawOpaqueRenderables", "testttjjd", function()
--
-- for k, v in pairs (ents.FindByClass("prop_physics")) do
--
--
--
--       render.SuppressEngineLighting(true)
--
--       render.ResetModelLighting(0.015, 0.015, 0.015)
--
--
-- end
-- end)
