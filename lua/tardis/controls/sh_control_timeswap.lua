
TARDIS:AddControl({
    id = "timeswap",
    ext_func = function(self,ply)

    self:TimeSwap()

    end,
    serveronly = true,
    power_independent = false,
    screen_button = {
        virt_console = true,
        mmenu = false,
        popup_only = false,
        toggle = true,
        frame_type = {2, 1},
        text = "Timeswap",
    },
    tip_text = "Space-Time Forward Back Control",
})
