ENT:AddHook("ShouldFailDemat", "DematLeavePlayerSafety", function(self, force)

    if self:GetDematLeave() then

        if self:GetCreator():GetTardisData("interior") then

            if not force then
                TARDIS:Message(self:GetCreator(), "Warning: Attempted to Desnyc Phase with living entity inside!")
            end

                        timer.Simple(4, function()

                            if not self:GetData("demat") then
                            self:ToggleDematLeave()
                            end

                        end)

            if force then
                TARDIS:Message(self:GetCreator(), "WARNING: Phase-Desync initiated!")
                self:GetCreator():ScreenFade(SCREENFADE.OUT, Color(180,180,180,255), 8, 10)
                else
                return true
            end

        end

    end

end)



ENT:AddHook("StopDemat", "DematLeaveDie", function(self)

    if self:GetDematLeave() then
        if self:GetCreator():GetTardisData("interior") then
        self:GetCreator():Kill()
        end
    end

end)


ENT:AddHook("HandbrakeToggled", "CleanupDelocalizedSound", function(self, on)

    if on then
        self:SetDematLeave(false)
    end

end)