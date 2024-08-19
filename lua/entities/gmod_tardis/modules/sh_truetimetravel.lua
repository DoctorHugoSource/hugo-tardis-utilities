-- the ultimate addition to the tardis addon, real time travel
-- this file is going to be adding stormfox 2 support


ENT:AddHook("PostInitialize", "timetravel_init", function(self)

    self:SetData("timetravel_amount", 0, true)

end)



ENT:AddHook("StopDemat", "sf2timetravel", function(self)  -- this is where the magic happens

if SERVER then

    if StormFox2 then

        local timeadd = self:GetData("timetravel_amount", 0)

        if timeadd == 0 then return end     -- if not time traveling, dont mess with stormfox time because it seems to behave weirdly when you 'add' zero time

            if not self:GetData("TimeState", false) then
                timeadd = timeadd * -1
            end

        StormFox2.Time.Set(StormFox2.Time.Get() + timeadd)

    end

end

end)