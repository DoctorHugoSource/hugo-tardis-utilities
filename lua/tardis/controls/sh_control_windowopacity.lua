
TARDIS:AddControl({
    id = "windowopacity",
    ext_func=function(self,ply)

    TARDIS:ApplyWindowTint(self)

    end,
    serveronly=true,
    power_independent = true,
    screen_button = {
        virt_console = true,
        mmenu = false,
        popup_only = false,
        toggle = true,
        frame_type = {2, 1},
        text = "Window Opacity",
    },
    tip_text = "Window Opacity",
})
