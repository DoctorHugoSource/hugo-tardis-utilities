TARDIS:AddControl({
    id = "forecast",
    ext_func=function(self,ply)
        TARDIS:PopToScreen("Scanner", ply)
    end,
    serveronly = true,
    power_independent = true,
    bypass_isomorphic = true,
    screen_button = false, -- already added as a screen
    tip_text = "Weather forecast",
})