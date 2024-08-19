
TARDIS:AddControl({
    id = "randomjazzmap",
    ext_func = function(self,ply)

        local map = GlobalJazzTardisMap

        if map == nil then
        TARDIS:Message(ply, "No Map Browser location detected")
        return end

        if self.exterior:GetTargetMap() == GlobalJazzTardisMap then
        self.exterior:SetTargetMap(nil)
        TARDIS:Message(ply, "Target Map set to none")
        else
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
        text = "Map Browser location",
    },
    tip_text = "Trolley Destination Download Processor",
})
