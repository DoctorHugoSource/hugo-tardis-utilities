local firsttime = 0
local index

TARDIS:AddControl({
    id = "extskinchanger",
    ext_func = function(self,ply)

        if firsttime == 0 then
            index = self.exterior:GetSkin()
        end

        index = index + 1  -- cycle ext skins

        if index >= self.exterior:SkinCount() then
            index = 0
        end

        firsttime = 1

        self.exterior:SetSkin(index)
        TARDIS:Message(ply, "Exterior appearance reconfigured to #".. tostring(index))

    end,
    serveronly = true,
    power_independent = false,
    screen_button = {
        virt_console = true,
        mmenu = false,
        popup_only = false,
        toggle = true,
        frame_type = {2, 1},
        text = "Change Ext Skin",
    },
    tip_text = "Exterior Appearance Reconfiguration",
})