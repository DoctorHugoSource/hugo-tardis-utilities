ENT:AddHook("OnHealthChange", "HADSClutch", function(self, newhealth, oldhealth)

    if oldhealth > 500 then

        if newhealth < 1 then

            if self:GetHADS() then
                timer.Simple( 0.5, function()
                TardisHADSClutch2 = true
                self.exterior:ChangeHealth(70)
                self.exterior:SetArtron(5)

                end)


                    timer.Simple( 0.7, function()

                    self:SetData("power-state",true,true)

                    self:TriggerHADS()
                    end)


                        timer.Simple( 5, function()
                        self:Extinguish()
                        self.exterior:Extinguish()
                        end)

                                    timer.Simple( 15, function()
                                    TardisHADSClutch2 = false
                                    end)

            end

        end

    end

end)

----------------------------------------------------------------------------------------------------------------------------------------------

ENT:AddHook("ShouldTakeDamage", "HADSClutch2", function(self)

    if TardisHADSClutch2 == true then
    return false
    end

end)
