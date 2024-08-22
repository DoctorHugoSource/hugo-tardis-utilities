

TARDIS:AddControl({
    id = "vortexswap",
    ext_func = function(self,ply)

        if self:GetData("TimeState", false) then
            TARDIS:Message(ply, "Warning! Reset Time Space Forward/Back Control first!")
        return end

        if self.vortexindex == nil then
           self.vortexindex = 0
        end

        self.vortexindex = self.vortexindex + 2

        if self.vortexindex >= 16 then
            self.vortexindex = 2
        end

        self:VortexSwap()


    end,
    serveronly = true,
    power_independent = false,
    screen_button = {
        virt_console = true,
        mmenu = false,
        popup_only = false,
        toggle = false,
        frame_type = {2, 1},
        text = "Switch vortex channel",
    },
    tip_text = "Vortex Channel Navigation Unit",
})
