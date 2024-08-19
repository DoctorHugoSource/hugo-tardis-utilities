
hook.Add("PlayerSpawn", "givetardiskeys", function (ply)

    ply:SetupHands()

if not SERVER then return end

    timer.Simple(0.4, function()

        ply:Give("tardis_keys")
        ply:SetupHands()  -- workaround for some bug on my jazztronauts build to cause viewmodels to not work on a first map spawn in the hub

    end)

end)



--     playerhaskeyss = unlocks.IsUnlocked("store", ply, tardiskeys_test2)
--
--     if playerhaskeyss then



    -- if engine.ActiveGamemode() == "jazztronauts" and game.GetMap() == "jazz_bar" then
    --     ply:Give("tardis_hands")
    -- end

-- DOES?? IT WORK???????????????
-- end)
