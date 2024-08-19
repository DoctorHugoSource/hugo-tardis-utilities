ENT:AddHook("PostInitialize", "InitVortexIndex", function(self)  -- setup vortex and time states on spawn

        timer.Simple( 1, function()  -- timer because it hates having stuff done to it during init

                self.vortexindex = 0
                self:SetData("TimeState", false, true)

    end)
end)

function ENT:VortexSwap()

        local mv = self.metadata.Exterior.TimeVortexes
        local sv
        local vtint
        local exttint
        local extamb

        if self.vortexindex == 2 then

                sv = mv.Nebula.model
                vtint = mv.Nebula.color
                exttint = mv.Nebula.tint
                extamb = mv.Nebula.Extambient

                self:SetData("Scheduledvortex",sv,true)

                self:SetData("ScheduledVortexTintColor",vtint,true)

                self:SetData("ScheduledVortexExtColor",exttint,true)

                self:SetData("ScheduledVortexAmbientColor",extamb,true)


                if self:GetData("TimeState", false) == false then
                TARDIS:Message(self:GetCreator(), "'Nebula' vortex channel selected")
                end


        elseif self.vortexindex == 4 then

                sv = mv.Plasma.model
                vtint = mv.Plasma.color
                exttint = mv.Plasma.tint
                extamb = mv.Plasma.Extambient

                self:SetData("Scheduledvortex",sv,true)

                self:SetData("ScheduledVortexTintColor",vtint,true)

                self:SetData("ScheduledVortexExtColor",exttint,true)

                self:SetData("ScheduledVortexAmbientColor",extamb,true)


                if self:GetData("TimeState", false) == false then
                TARDIS:Message(self:GetCreator(), "'Plasma' vortex channel selected")
                end


        elseif self.vortexindex == 6 then

                sv = mv.Swirl.model
                vtint = mv.Swirl.color
                exttint = mv.Swirl.tint
                extamb = mv.Swirl.Extambient

                self:SetData("Scheduledvortex",sv,true)

                self:SetData("ScheduledVortexTintColor",vtint,true)

                self:SetData("ScheduledVortexExtColor",exttint,true)

                self:SetData("ScheduledVortexAmbientColor",extamb,true)


                if self:GetData("TimeState", false) == false then
                TARDIS:Message(self:GetCreator(), "'Swirl' vortex channel selected")
                end


        elseif self.vortexindex == 8 then

                sv = mv.Clouds.model
                vtint = mv.Clouds.color
                exttint = mv.Clouds.tint
                extamb = mv.Clouds.Extambient

                self:SetData("Scheduledvortex",sv,true)

                self:SetData("ScheduledVortexTintColor",vtint,true)

                self:SetData("ScheduledVortexExtColor",exttint,true)

                self:SetData("ScheduledVortexAmbientColor",extamb,true)


                if self:GetData("TimeState", false) == false then
                TARDIS:Message(self:GetCreator(), "'Clouds' vortex channel selected")
                end


        elseif self.vortexindex == 10 then

                sv = mv.Water.model
                vtint = mv.Water.color
                exttint = mv.Water.tint
                extamb = mv.Water.Extambient

                self:SetData("Scheduledvortex",sv,true)

                self:SetData("ScheduledVortexTintColor",vtint,true)

                self:SetData("ScheduledVortexExtColor",exttint,true)

                self:SetData("ScheduledVortexAmbientColor",extamb,true)


                if self:GetData("TimeState", false) == false then
                TARDIS:Message(self:GetCreator(), "'Water' vortex channel selected")
                end


        elseif self.vortexindex == 12 then

                sv = mv.FieryPast.model
                vtint = mv.FieryPast.color
                exttint = mv.FieryPast.tint
                extamb = mv.FieryPast.Extambient

                self:SetData("Scheduledvortex",sv,true)

                self:SetData("ScheduledVortexTintColor",vtint,true)

                self:SetData("ScheduledVortexExtColor",exttint,true)

                self:SetData("ScheduledVortexAmbientColor",extamb,true)


                if self:GetData("TimeState", false) == false then
                TARDIS:Message(self:GetCreator(), "'Fiery' vortex channel selected")
                end


        elseif self.vortexindex == 14 then

                sv = mv.Clockwork.model
                vtint = mv.Clockwork.color
                exttint = mv.Clockwork.tint
                extamb = mv.Clockwork.Extambient

                self:SetData("Scheduledvortex",sv,true)

                self:SetData("ScheduledVortexTintColor",vtint,true)

                self:SetData("ScheduledVortexExtColor",exttint,true)

                self:SetData("ScheduledVortexAmbientColor",extamb,true)


                if self:GetData("TimeState", false) == false then
                TARDIS:Message(self:GetCreator(), "'Clockwork' (experimental) vortex channel selected")
                end


        end




        if self.vortexindex == 1 then

                sv = mv.NebulaFuture.model
                vtint = mv.NebulaFuture.color
                exttint = mv.NebulaFuture.tint
                extamb = mv.NebulaFuture.Extambient

                self:SetData("Scheduledvortex",sv,true)

                self:SetData("ScheduledVortexTintColor",vtint,true)

                self:SetData("ScheduledVortexExtColor",exttint,true)

                self:SetData("ScheduledVortexAmbientColor",extamb,true)


        elseif self.vortexindex == 3 then

                sv = mv.NebulaFuture.model
                vtint = mv.NebulaFuture.color
                exttint = mv.NebulaFuture.tint
                extamb = mv.NebulaFuture.Extambient

                self:SetData("Scheduledvortex",sv,true)

                self:SetData("ScheduledVortexTintColor",vtint,true)

                self:SetData("ScheduledVortexExtColor",exttint,true)

                self:SetData("ScheduledVortexAmbientColor",extamb,true)


        elseif self.vortexindex == 5 then

                sv = mv.PlasmaFuture.model
                vtint = mv.PlasmaFuture.color
                exttint = mv.PlasmaFuture.tint
                extamb = mv.PlasmaFuture.Extambient

                self:SetData("Scheduledvortex",sv,true)

                self:SetData("ScheduledVortexTintColor",vtint,true)

                self:SetData("ScheduledVortexExtColor",exttint,true)

                self:SetData("ScheduledVortexAmbientColor",extamb,true)


        elseif self.vortexindex == 7 then

                sv = mv.SwirlFuture.model
                vtint = mv.SwirlFuture.color
                exttint = mv.SwirlFuture.tint
                extamb = mv.SwirlFuture.Extambient

                self:SetData("Scheduledvortex",sv,true)

                self:SetData("ScheduledVortexTintColor",vtint,true)

                self:SetData("ScheduledVortexExtColor",exttint,true)

                self:SetData("ScheduledVortexAmbientColor",extamb,true)


        elseif self.vortexindex == 9 then

                sv = mv.CloudsFuture.model
                vtint = mv.CloudsFuture.color
                exttint = mv.CloudsFuture.tint
                extamb = mv.CloudsFuture.Extambient

                self:SetData("Scheduledvortex",sv,true)

                self:SetData("ScheduledVortexTintColor",vtint,true)

                self:SetData("ScheduledVortexExtColor",exttint,true)

                self:SetData("ScheduledVortexAmbientColor",extamb,true)


        elseif self.vortexindex == 11 then

                sv = mv.WaterFuture.model
                vtint = mv.WaterFuture.color
                exttint = mv.WaterFuture.tint
                extamb = mv.WaterFuture.Extambient

                self:SetData("Scheduledvortex",sv,true)

                self:SetData("ScheduledVortexTintColor",vtint,true)

                self:SetData("ScheduledVortexExtColor",exttint,true)

                self:SetData("ScheduledVortexAmbientColor",extamb,true)


        elseif self.vortexindex == 13 then

                sv = mv.Fiery.model
                vtint = mv.Fiery.color
                exttint = mv.Fiery.tint
                extamb = mv.Fiery.Extambient

                self:SetData("Scheduledvortex",sv,true)

                self:SetData("ScheduledVortexTintColor",vtint,true)

                self:SetData("ScheduledVortexExtColor",exttint,true)

                self:SetData("ScheduledVortexAmbientColor",extamb,true)

        end

end



ENT:AddHook("DematStart", "applyvortexchannel", function(self)

if self:GetData("Scheduledvortex",nil) == nil then return end

        self.parts.vortex:SetModel(self:GetData("Scheduledvortex",nil))

        local aptint = self:GetData("ScheduledVortexTintColor",nil)
        self:SetData("VortexTintColor",aptint,true)

        self:SetData("CustomVortexEnabled",true,true)  -- enabled all vortex swap related functions

        local exaptint = self:GetData("ScheduledVortexExtColor",nil)
        self:SetData("VortexExtColor",exaptint,true)

        local extambientc = self:GetData("ScheduledVortexAmbientColor",nil)
        self:SetData("VortexAmbientColor",extambientc,true)

end)



ENT:AddHook("PostInitialize", "applyvortex", function(self)

        timer.Simple(2, function()

        if not IsValid(self) then return end

        if self:GetData("Scheduledvortex",nil) == nil then return end

        self.parts.vortex:SetModel(self:GetData("Scheduledvortex",nil))

        local aptint = self:GetData("ScheduledVortexTintColor",nil)
        self:SetData("VortexTintColor",aptint,true)

        self:SetData("CustomVortexEnabled",true,true)  -- enabled all vortex swap related functions

        local exaptint = self:GetData("ScheduledVortexExtColor",nil)
        self:SetData("VortexExtColor",exaptint,true)

        local extambientc = self:GetData("ScheduledVortexAmbientColor",nil)
        self:SetData("VortexAmbientColor",extambientc,true)

        end)

end)



function ENT:TimeSwap()

        if self:GetData("Scheduledvortex",nil) == nil then  -- dont allow any of this when vortex swap isnt active
                TARDIS:Message(self:GetCreator(), "Warning! Vortex Channel Navigation Unit offline!")
        return end


        local timestate = self:GetData("TimeState", false)


        if timestate == false then
        self.vortexindex = self.vortexindex + 1
        TARDIS:Message(self:GetCreator(), "TARDIS now traveling to the future")
        self:VortexSwap()
        else
        self.vortexindex = self.vortexindex - 1
        TARDIS:Message(self:GetCreator(), "TARDIS now traveling to the past")
        self:VortexSwap()
        end

        self:SetData("TimeState", (not timestate), true)

end




--         local vang = self.exterior.parts.vortex:GetAngles()
--
--         vang:RotateAroundAxis(Vector (0,1,1),90 )
--         self.exterior.parts.vortex:SetAngles( vang )
