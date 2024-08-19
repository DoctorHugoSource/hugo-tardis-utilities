
TARDIS:AddControl({
    id = "mathop_shortcut",
    ext_func = function(self,ply)

        if self:GetData("teleport",false) or self:GetData("vortex",false) then
            TARDIS:Message(self:GetCreator(), "Failed to toggle MatHop")
        return end

        if self.exterior:GetFastRemat() then

            if self.exterior:GetMatHop() then
            self.exterior:ToggleFastRemat()
            self.exterior:ToggleMatHop()
            TARDIS:Message(ply, "Fast Remat and MatHop disabled")
            else
            self.exterior:ToggleMatHop()
            TARDIS:Message(ply, "MatHop enabled")
            end

        elseif not self.exterior:GetFastRemat() then

            if self.exterior:GetMatHop() then
            self.exterior:ToggleFastRemat()
            TARDIS:Message(ply, "MatHop active, Fast Remat enabled")
            else
            self.exterior:ToggleFastRemat()
            self.exterior:ToggleMatHop()
            TARDIS:Message(ply, "Fast Remat and MatHop enabled")
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
        text = "MatHop Quick Access",
    },
    tip_text = "Engine Quick Calibration",
})
