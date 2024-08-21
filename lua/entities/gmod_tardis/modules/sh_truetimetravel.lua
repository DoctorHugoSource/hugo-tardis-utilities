-- the ultimate addition to the tardis addon, real time travel
-- this file is going to be adding stormfox 2 support


ENT:AddHook("PostInitialize", "timetravel_init", function(self)

    self:SetData("timetravel_amount", 0, true)

end)



ENT:AddHook("StopDemat", "sf2timetravel", function(self)  -- this is where the magic happens

if SERVER then

    if (self:GetCreator():GetTardisData("interior") == self.interior) == false then return end -- dont time travel when player isnt inside


    if StormFox2 then

        local timeadd = self:GetData("timetravel_amount", 0)  -- get the amount of time to travel

        if timeadd == 0 then return end     -- if not time traveling, dont mess with stormfox time because it seems to behave weirdly when you 'add' zero time


            if not self:GetData("TimeState", false) then -- traveling to the past (negative values) by default, timestate == true = future

                timeadd = timeadd * -1  -- enable travel to past

                    if timeadd == -1440 then  -- i was hoping skipping 1 day at a time would affect weather patterns in sf2, but it doesnt, so ill do it manually

                        local pastweather = self:GetData("ttweather_cached", nil)  -- get the weather of the previous day from the last time a full day was skipped

                        CWI.SetWeather(pastweather)

                    end

                StormFox2.Time.Set(StormFox2.Time.Get() + timeadd)  -- change time

            end




            if self:GetData("TimeState", false) then -- future timetravel logic

                if timeadd == 1440 then  -- i was hoping skipping 1 day at a time would affect weather patterns in sf2, but it doesnt, so ill do it manually
                print (CWI.GetWeather())
                    local curweather = CWI.GetWeather()  -- get the current weather
                    self:SetData("ttweather_cached", curweather, true) -- for later usage if traveling back to the past


                local ttweathers = {
                    "rain",
                    "fog",
                    "cloud",
                    "clear",
                    -- [4]	=	sandstorm,  -- dont do the unrealistic ones
                    -- [5]	=	radioactive,
                    -- [6]	=	lava,
                    }


                    local appliedweather = table.Random(ttweathers)  -- change weather when skipping a full day
                    CWI.SetWeather(appliedweather) -- set weather
                    print (appliedweather)

                end

                StormFox2.Time.Set(StormFox2.Time.Get() + timeadd)

            end





    end

end

end)