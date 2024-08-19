
ENT:AddHook("OnHealthChange", "BetterCrashing", function(self, newhealth, oldhealth)

    timer.Simple( 0, function()
            if self:IsBroken() then

                if self:GetData("teleport", false) then return end -- dont do this stuff while teleporting or starting a teleport

                    self:SetFlight(true) -- make the tardis enable flight mode when becoming heavily damaged, because it keeps doing that in the show for some reason and it's a fun gameplay idea
                                         -- also i'm aware this will enable flight mode every time it takes any damage, but ill just keep that in cause it adds chaos and thats fun
                                         -- the object is basically gonna be managing to reach the handbrake while being thrown around the console room to manage to land
                        if self:IsBroken() and self:GetFlight() then


                            local chance = math.random(0, 10)

                                if chance < 2 then -- small chance to open the door on any given collision, adds some more chaos and fear of falling out
                                    if not self:DoorOpen() then
                                        self:ToggleDoor() -- got this idea from the show itself too, man the tardis behaves really weirdly when crashing (11th hour, twice upon a time)
                                    end                   -- also the door lock can mitigate this which adds a new use for it and also a bit more mechanical 'deph' to a skilled tardis operator so thats cool
                                end
                        end

                    if not self:GetHandbrake() then
                    self:GetPhysicsObject():AddVelocity(Vector(0,0,250)) -- make it get going to enable the broken flight mode
                    end

            end
    end)

end)