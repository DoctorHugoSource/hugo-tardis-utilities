
TARDIS:AddControl({
    id = "returntobar",
    ext_func = function(self,ply)

        if self.exterior:GetTargetMap() == "jazz_bar" then  -- if the target map is already jazz bar (aka this control has been used previously) reset the target map to none
        self.exterior:SetTargetMap(nil)
        TARDIS:Message(ply, "Target Map set to none")
        else
        local map = "jazz_bar"
        self.exterior:SetTargetMap(map)                     -- else set target map to the bar
        TARDIS:Message(ply, "Target Map set to Bar Samsara")
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
        text = "Locate Bar Samsara",
    },
    tip_text = "Samsara Beacon Compass",
})
