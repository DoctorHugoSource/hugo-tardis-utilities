
TARDIS:AddControl({
    id = "timetravel_increment",            -- this allows the tardis to interface with stormfox2's time system, finally allowing true time travel
    ext_func = function(self,ply)

        local curtime = self:GetData("timetravel_amount", 0)

        local timeadd = 360



        self:SetData("timetravel_amount", curtime + timeadd, true)

        local increment = curtime + timeadd

        if increment > 1440 then
            increment = 0
            self:SetData("timetravel_amount", 0, true)
        end

        if increment < 0 then
            increment = 0
            self:SetData("timetravel_amount", 0, true)
        end

        if increment == 360 then
            TARDIS:Message(ply, "Time travel increment set to 1/4 day")     -- maybe there's a more efficient way to do this than 20 elseif statements but idk how
        elseif increment == 720 then
            TARDIS:Message(ply, "Time travel increment set to 1/2 day")
        elseif increment == 1080 then
            TARDIS:Message(ply, "Time travel increment set to 3/4 day")
        elseif increment == 1440 then
            TARDIS:Message(ply, "Time travel increment set to 1 day")
        elseif increment == 0 then
            TARDIS:Message(ply, "TARDIS synced to local time")
        end

print (self:GetData("timetravel_amount", 0))

    end,
    serveronly = true,
    power_independent = false,
    screen_button = {
        virt_console = true,
        mmenu = false,
        popup_only = false,
        toggle = false,
        frame_type = {2, 1},
        text = "Increment Time travel Amount",
    },
    tip_text = "Time Delta Circuits",
})
