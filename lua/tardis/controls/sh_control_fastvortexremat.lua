
TARDIS:AddControl({
    id = "fastvortexremat",
    ext_func = function(self,ply)

            self:ToggleFastVortexRemat()

            if not self:GetFastVortexRemat() then
            TARDIS:Message(self:GetCreator(), "Octiron Obliberation Reactor disabled")
            else
                if self:IsLowHealth() then
                TARDIS:Message(self:GetCreator(), "Warning! Octiron Obliberation Reactor Impaired!")
                else
                TARDIS:Message(self:GetCreator(), "Octiron Obliberation Reactor enabled")
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
        text = "Toggle Fast Vortex Remat",
    },
    tip_text = "Octiron Obliberation Reactor",
})
