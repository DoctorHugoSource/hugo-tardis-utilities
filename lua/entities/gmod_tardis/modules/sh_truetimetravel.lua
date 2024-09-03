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

                timer.Simple(0.3, function()  -- give weather time to update
                    StormFox2.Temperature.Set(TARDIS:Get_TT_Temp(), 0.1)
                end)

            end




            if self:GetData("TimeState", false) then -- future timetravel logic

                print (CWI.GetWeather())

                if timeadd == 1440 then  -- i was hoping skipping 1 day at a time would affect weather patterns in sf2, but it doesnt, so ill do it manually

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

                    -- local realtemp = TARDIS:Get_TT_Temp()  -- this manual fix must be here because stormfox temperature does not update when adding or subtracting time

                        local targettimes = {  -- daily weather is split into increments
                            480,
                            960,
                            1440,
                        }


                        local function nextday(targettimes, midtime)  -- i think this is necessary to retreive the time of the end of the next day, to calculate the incoming temperature
                            local closest = nil
                            local smallest_diff = 9999

                            for _, num in ipairs(targettimes) do
                                local diff = math.abs(num - midtime)
                                if diff < smallest_diff then
                                    smallest_diff = diff
                                    closest = num
                                end
                            end

                            return closest
                        end


                            local function TTupdatetemperature()

                                local oldtemp = TARDIS:Get_TT_TempOld() - 0.1  -- get temperature of the previous increment, for lerp calculation
                                local oldtime = StormFox2.Time.Get()  -- time before timetravel

                                if StormFox2.Time.Get() + timeadd >= 1440 then -- if we're time traveling past the end of the current day, alert sf2 and update the day
                                SF2ForceNextDay()                              -- this is important to update the weather patterns
                                end                                            -- because otherwise the current day and its weather will actually just loop

                                    StormFox2.Time.Set(StormFox2.Time.Get() + timeadd)  -- travel the set amount of time

                                    timer.Simple(0.3, function()  -- give weather time to update

                                        local newtime = StormFox2.Time.Get()  -- time after timetravel

                                        local targettime = nextday(targettimes, newtime + 480)  -- time of the next upcoming increment, for temperature lerp

                                        local midtime = math.abs(targettime - oldtime)  -- calculate difference...

                                        local lerpedtime = (newtime - oldtime) / (targettime - oldtime)  -- determine the amount of progress from previous time, to next weather increment


                                            local realtemp = (TARDIS:Get_TT_Temp() + 0.1)  -- get the temperature of the next increment

                                            local lerptemp = ((((oldtemp - realtemp) * lerpedtime) - oldtemp) * -1)  -- finally calculate the true temperature for the current time


                                                StormFox2.Temperature.Set(lerptemp, 2)  -- apply temperature

                                        print (CWI.GetWeather())  -- print the new weather for debugging

                                    end)

                            end

                            TTupdatetemperature()  -- run function

                -- end)

            end





    end

end

end)