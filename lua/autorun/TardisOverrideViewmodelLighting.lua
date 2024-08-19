if SERVER then return end

function TardisPreDrawVMLO(vm, ply, wep)

if LocalPlayer():GetTardisData("vmlocoldisable") then return end -- oh my god.

if not vm then return end

      local vmlocol = LocalPlayer():GetTardisData("vmlocol")  -- get the desired color

      local enabled = LocalPlayer():GetTardisData("interior") -- seems like this can track if player is in the tardis or not; no bool needed

      render.SuppressEngineLighting(enabled)

      if vmlocol == nil then return end          -- dont spew errors if the value is empty

      render.ResetModelLighting(vmlocol, vmlocol, vmlocol)

end

----------------------------------------------------------------------------------------------------------------------------------------------

hook.Add("PreDrawViewModel", "TardisInteriorViewmodelLighting", TardisPreDrawVMLO )

hook.Add("PrePlayerDraw", "TardisInteriorViewmodelLighting", TardisPreDrawVMLO )    -- for playermodels

----------------------------------------------------------------------------------------------------------------------------------------------


-- no longer needed?
-- hook.Add("EntityRemoved", "TardisInteriorViewmodelLightingDisabler", function(ent)      -- disable on tardis delete
--
--       if ent:GetClass() == "gmod_tardis" then
--
--             TardisViewmodelLightingOverrideBool = false
--
--       end
-- end)






