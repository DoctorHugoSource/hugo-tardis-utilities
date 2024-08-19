function TARDIS:OverrideIntLightColor(self)

    local intcol = ColorRand( false )

    self:SetData("CustomInteriorLightColor", intcol, true)
    self:SetData("CustomInteriorLightColorEnabled", true, true)

end

function TARDIS:OverrideIntBrightness(self)

    local intbr = math.Rand( 0.0002, 0.02 )
    self:SetData("CustomInteriorLightBrightness", intbr, true)
    self:SetData("CustomInteriorLightBrightnessEnabled", true, true)

end


if SERVER then return end


-- matproxy for roundel colors

matproxy.Add({

name = "TARDIS_customcolors",

init = function( self, mat, values )

self.ResultTo = values.resultvar

end,


bind = function( self, mat, ent )

    if ent.interior then

    local newcol

    if ent:IsValid() then -- spews errors if tardis not existing


        if ent:GetData("CustomInteriorLightColorEnabled",false) == true then
        newcol = ent:GetData("CustomInteriorLightColorFade",nil):ToVector()
        else
        newcol = Color(255, 255, 255):ToVector()
        end


        local appliedcol = Vector(newcol.x, newcol.y, newcol.z)


        mat:SetVector ( self.ResultTo, (appliedcol) )

        end
    end
end
})

----------------------------------------------------------------------------------------------------------------------------------------------
