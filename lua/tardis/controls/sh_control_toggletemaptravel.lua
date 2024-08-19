
TARDIS:AddControl({
    id = "maptravel",
    ext_func = function(self,ply)

    self.exterior:ToggleMapTravel()

        if self:GetMapTravel() then                                 -- eventually update this to use the proper format, including support for language translation and stuff
        TARDIS:Message(ply, "Map Travel enabled")
        else
        TARDIS:Message(ply, "Map Travel disabled")
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
        text = "Toggle Map Travel",
    },
    tip_text = "Directional Unit",
})
