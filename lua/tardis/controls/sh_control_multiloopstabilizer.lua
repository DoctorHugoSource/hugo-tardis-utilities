
TARDIS:AddControl({
    id = "multiloopstabiliser",
    ext_func = function(self,ply)

            self.exterior:ToggleMultiloopStabiliser()

            if not self.exterior:GetMultiloopStabiliser() then
            TARDIS:Message(self:GetCreator(), "Multiloop Stabiliser disabled")
            else
                if self:IsLowHealth() then
                TARDIS:Message(self:GetCreator(), "Warning! Multiloop Stabiliser Nonfunctional!")
                else
                TARDIS:Message(self:GetCreator(), "Multiloop Stabiliser enabled")
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
        text = "Toggle Multiloop Stabiliser",
    },
    tip_text = "Multiloop Stabiliser Control",
})
