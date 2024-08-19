
TARDIS:AddControl({
    id = "manualmapdestination",
    ext_func = function(self,ply)

                                        -- todo: allow any map name to be manually input

        if self.exterior:GetTargetMap() == "gm_construct" then  -- if target map is already set, set to none
        self.exterior:SetTargetMap(nil)
        TARDIS:Message(ply, "Target Map set to none")
        else
        local map = "gm_construct"                              -- else set to selected map
        self.exterior:SetTargetMap(map)
        TARDIS:Message(ply, "Target Map set to ".. tostring(map))
        end


    end,
    serveronly = true,
    power_independent = false,
    screen_button = {
        virt_console = true,
        mmenu = false,
        popup_only = false,
        toggle = true,
        frame_type = {2, 1},
        text = "Manual Map Destination",
    },
    tip_text = "Conceptual Geometer",
})
