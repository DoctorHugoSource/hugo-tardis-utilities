TardisMuteExtraAmbience = false


hook.Add("EntityEmitSound", "TardisInteriorSilenceAmbience", function (data)

    if TardisMuteExtraAmbience == true then

        if data.Entity == Entity(0) then
        return false
        end

    end

end)






-- if SERVER then
--
-- util.AddNetworkString( "TardisViewmodelBrightness" )
--
-- util.AddNetworkString( "TardisEnableViewmodelBrightness" )
--
-- if not IsValid(jazztardis) then
--
--  net.Start( "TardisEnableViewmodelBrightness")
--  net.WriteBool( false )
--  net.Broadcast()
--
-- end
--
-- if IsValid(jazztardis) then
--
-- vmlo = jazztardis.metadata.Interior.LightOverride
--
--
-- vmbr = jazztardis:GetPower() and vmlo.basebrightness or vmlo.nopowerbrightness
--
--
--
--  net.Start( "TardisViewmodelBrightness")
--  net.WriteFloat( vmbr )
--  net.Broadcast()
--
--   net.Start( "TardisEnableViewmodelBrightness")
--  net.WriteBool( true )
--  net.Broadcast()
--
--  end
-- end

-- if CLIENT then
--   net.Receive( "TardisViewmodelBrightness", function(len, ply)
--   vmbr1 = net.ReadFloat()
--   print (vmbr1)
--   end)
-- end






-- local function predraw_vm( ent )
--
-- ent = Entity(1):GetViewModel()
--
-- print (ent )
--
--     render.SuppressEngineLighting(true)
--
--     render.ResetModelLighting(0.1, 0.1, 0.1)
--
-- end
--
-- ENT:AddHook("PreDraw", "customlightingvm", predraw_vm)











