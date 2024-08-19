
TARDIS:AddControl({
    id = "vortexdrift",
    ext_func = function(self,ply)

            self.exterior:ToggleVortexDrift()

            if self.exterior:GetVortexDrift() then
            TARDIS:Message(self:GetCreator(), "Vortex Drift Compensators disabled")
            else
                if self:IsLowHealth() then
                TARDIS:Message(self:GetCreator(), "Warning! Vortex Drift Compensators nonfunctional!")
                else
                TARDIS:Message(self:GetCreator(), "Vortex Drift Compensators enabled")
                end
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
        text = "Toggle vortex drift",
    },
    tip_text = "Vortex Drift Compensators",
})
