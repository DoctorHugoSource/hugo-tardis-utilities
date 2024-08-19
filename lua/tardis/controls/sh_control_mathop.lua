
TARDIS:AddControl({
    id = "mathop",
    ext_func = function(self,ply)

        if self:GetData("teleport",false) or self:GetData("vortex",false) then
            TARDIS:Message(self:GetCreator(), "Failed to toggle MatHop")
        return end

        if self.exterior:GetFastRemat() then

            self.exterior:ToggleMatHop()

            if self.exterior:GetMatHop() then
            TARDIS:Message(self:GetCreator(), "MatHop enabled")
            else
            TARDIS:Message(self:GetCreator(), "MatHop disabled")
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
        text = "Toggle MatHop",
    },
    tip_text = "Engine Thermals Bypass",
})
