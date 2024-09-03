
if SERVER then return end

-- ENT:AddHook("PlayerEnter", "initphase", function(self)
--
-- self:SetData("phaseinit",true,true)
--
-- end)




-- the matproxy that makes the phase possible

matproxy.Add({

name = "TARDIS_PhaseEffect",

init = function( self, mat, values )

self.ResultTo = values.resultvar
self.ResultTo2 = values.resultvar2
self.ResultTo3 = values.resultvar3
self.ResultTo4 = values.resultvar4

end,

bind = function( self, mat, ent )

    if IsValid(ent.interior) then

    if LocalPlayer():GetTardisData("interior") then return end  -- dont bother with any of this if the player is inside

    if ent.interior.metadata.Interior.PhaseData == nil then return end  -- if an extension doesnt have these values defined, dont run this and instead use default transparency

    -- if GetConVar("hugoextension_tardis2_PhaseEffect"):GetBool() == false then return end -- actually dont place it here

    local ExponentValue
    local GhostValue
    local defaultexponent = ent.interior.metadata.Interior.PhaseData.DefaultPhongExponent          -- these have to be here because i dont think you can get
    local defaultboost = ent.interior.metadata.Interior.PhaseData.DefaultPhongBoost                -- the default values of a vmt in any way
    local phasemult = ent.interior.metadata.Interior.PhaseData.PhaseMult
    local phongboostmult = ent.interior.metadata.Interior.PhaseData.PhongBoostMult


    if ent:GetClass() == "gmod_tardis" then -- spews errors if tardis not existing

    if ent:GetData("teleport", false) == true then

        ExponentValue = (25 * ( ent:GetData("alpha",255)/255 * ent:GetData("alpha",255)/255 ))
        GhostValue = 0 + ( (ent:GetData("alpha",255)/255 - 1) * -1 )


        ExponentValue = ExponentValue * (ent:GetData("alpha",255)/255)
        GhostValue = GhostValue * GhostValue * GhostValue


                local mat = ent:GetData("mat",false)

                if (ent:GetData("alpha",255) <= 20) and not mat then
                GhostValue = GhostValue * ( ent:GetData("alpha",255)/255 )
                end

                if ent:GetData("alpha",255) >= 200 then
                GhostValue = GhostValue * 0
                end

                if ent:GetData("alpha",255) >= 250 then
                ExponentValue = defaultexponent
                end

    else

        ExponentValue = defaultexponent
        GhostValue = 0

    end


    CalcExponentIntensity = math.Approach( ent:GetData("expintensity", defaultexponent), ExponentValue, FrameTime() * 10 )
    CalcGhostIntensity = math.Approach( ent:GetData("ghostintensity", 0), GhostValue, FrameTime() * 0.07 )
    AdjustedGhostIntensity = CalcGhostIntensity * phasemult  -- 1

            if CalcExponentIntensity > defaultexponent then  -- if an exterior's exponent is already really low itll awkwardly become less glossy when demat starts
                CalcExponentIntensity = defaultexponent
            end

        local AppliedExponentIntensity = Vector(CalcExponentIntensity, CalcExponentIntensity, CalcExponentIntensity)
        local AppliedGhostIntensity = Vector(AdjustedGhostIntensity, AdjustedGhostIntensity, AdjustedGhostIntensity)

            if ent:GetData("teleport",false) == true then
            GlossinessIntensity = Vector((CalcGhostIntensity * phongboostmult) + defaultboost, (CalcGhostIntensity * phongboostmult) + defaultboost, (CalcGhostIntensity * phongboostmult) + defaultboost)
            else
            GlossinessIntensity = Vector(defaultboost,defaultboost,defaultboost)        -- could have defined as a vector in metadata directly but
            end                                                                         -- defining a simple number is more intuitive for extension devs

        local ambientbrightness = (ent:GetData("ambcol", Vector(0,0,0)) * 1)


        if StormFox2 then  -- update: adjust ambient light to time of day for time travel support
            local timemodifier = StormFox2.Time.Get()

            if (timemodifier <= 360) or (timemodifier >= 1080) then

            if timemodifier >= 1080 then
                timemodifier = math.abs(timemodifier - 1440)
            end

            ambientbrightness = ambientbrightness * ((timemodifier / 1440) * 0.1)
            end

        end

        AppliedGhostIntensity = AppliedGhostIntensity * math.Clamp ((ambientbrightness.y + ambientbrightness.x + ambientbrightness.z), 0, 0.7)  -- account for ambient light level
                                                                                                                                                  -- but dont go too bright or too dark

            if GetConVar("hugoextension_tardis2_PhaseEffect"):GetBool() == false then  -- disable the effect when user chooses to, but make sure the values are reset to baseline
                                                                                    -- otherwise the effect would be 'stuck' in whatever 'frame' it was in if the effect was disabled during demat
                AppliedGhostIntensity = Vector(0,0,0)
                GlossinessIntensity = Vector(defaultboost, defaultboost, defaultboost)
                AppliedExponentIntensity = Vector(defaultexponent, defaultexponent, defaultexponent)

            end

        -- finally apply the effect
        mat:SetVector ( self.ResultTo, (AppliedExponentIntensity) )
        mat:SetVector ( self.ResultTo2, (AppliedGhostIntensity) )
        mat:SetVector ( self.ResultTo4, (GlossinessIntensity) )

        ent:SetData("expintensity", CalcExponentIntensity, true )
        ent:SetData("ghostintensity", CalcGhostIntensity, true )
        end
    end
end
})

----------------------------------------------------------------------------------------------------------------------------------------------






