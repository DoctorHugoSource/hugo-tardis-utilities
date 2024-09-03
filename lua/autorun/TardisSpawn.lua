function TARDISspawn(ply)


    timer.Simple(2, function()  -- wait 3 seconds before spawning the tardis after loading in to prevent crashes -- 2

local tardisspawnposj = ply:GetPos()     -- getting player spawn position
local tardisspawnangj = ply:EyeAngles()  -- getting player spawn angles

          local interior = file.Read ("tardiskey_selected_interior.txt", DATA )

          if interior == nil then  -- failsafe if the file is empty
            interior = default
          end

        local customData = {
            metadataID = interior,          -- toyota_2017_F -- series 10 capaldi interior my beloved
            pos = ply:GetPos(),
            spawndemated = true
        }

    jazztardis = TARDIS:SpawnTARDIS(ply, customData, true)
    jazztardis:SetDestination(tardisspawnposj, tardisspawnangj, true) -- set landing destination to the player spawn point
    jazztardis:ApplyStats()


            timer.Simple(2, function()  -- give the tardis 2 seconds to spawn in and load the interior, then put player inside
            jazztardis:PlayerEnter(ply)

                if IsValid(jazztardis.interior) then

                local savedintang = file.Read ("tardis_stats_plyangle.txt", DATA)
                local savedintangang = Angle(savedintang)

                local savedintpos = file.Read ("tardis_stats_plyposition.txt", DATA)
                local savedintposvec = Vector(savedintpos)

                ply:SetPos(jazztardis.interior:LocalToWorld(savedintposvec))
                ply:SetEyeAngles(jazztardis.interior:LocalToWorldAngles(savedintangang))

                end

            end)

    end)

    tardisinitialspawn = false   -- make sure it doesnt trigger again when you die and respawn
end


-----------------------------------------------------------------------------------------------------------------------------------------------

hook.Add("PlayerInitialSpawn", "tardisspawningsetup", function (ply)

tardisinitialspawn = false

local camewithtardis = tobool ( file.Read ("tardis_stats_maptransited.txt", DATA ) )

if camewithtardis == true then

tardisinitialspawn = true -- workaround to make sure the player has actually spawned before running this script
                          -- because PlayerInitialSpawn activates before the player spawns in the map

        file.Write ("tardis_stats_maptransited.txt", "false" )
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------------

hook.Add("PlayerSpawn", "tardisspawning", function (ply)

    local missing = nil
    local requiredaddons = {

        "addons/hugo-tardis-utilities-main",
        "addons/tardis_main_hugoextension_-main",
        "addons/doors-hugoextension-main",

    }

    for k, v in pairs(requiredaddons) do

        local missingf

        missingf = file.Exists(v, "GAME")

        if missingf == false then
            missing = true
        end

    end


    if missing == true then
        PrintMessage(3, "[TARDIS diagnosis] A vital part of hugo tardis utilities is missing; if the addon isn't working, make sure you have all the files")
    end





    if IsValid(jazztardis) then return end -- dont run script if the tardis already exists for some reason


    if tardisinitialspawn == true then

    ply:ScreenFade(SCREENFADE.IN, Color(180,180,180,255), 0.1, 4)   -- prevents the player from seeing the map, because the tardis doesn't
                                                                      -- spawn in instantly

        if not SERVER then return end          -- only serverside

        TARDISspawn(ply)

    end
end)


-----------------------------------------------------------------------------------------------------------------------------------------------



