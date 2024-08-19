function TARDIS:ApplyWindowTint(self)

    if not self:GetWindowTint() then

        if not IsValid(self.interior) then return end

    local proxymd = self.interior.metadata.Interior.TintProxies_Int
    local door = self.interior.parts.door

        for index, mat in pairs (proxymd) do
        door:SetSubMaterial(index, mat)
        end

    self:ToggleWindowTint()

    else

    local proxymd = self.interior.metadata.Interior.TintProxies_Int
    local door = self.interior.parts.door

        for index, mat in pairs (proxymd) do
        door:SetSubMaterial(index, "")
        end

    self:ToggleWindowTint()

    end

end



if SERVER then

    ENT:AddHook("PostInitialize", "Setwindowtint", function(self)  -- this is here to apply the tint on spawn


        timer.Simple( 3, function()  -- timer because it hates having stuff done to it during init

            if IsValid(self) then  -- if despawned, timer fails...

                if self:GetWindowTint() then  -- setting that enables automatic applying of windowtint
                    self:ToggleWindowTint()
                    TARDIS:ApplyWindowTint(self)

                end
            end
        end)

    end)

end


if SERVER then return end

--setup variables

local appliedtint = Vector (0,0,0)

local curtint = Vector (0,0,0)

local newtint = Vector (0,0,0)

local factor = 1

local phase = 1

local vortex = Vector (0,0,0)

local dark = Vector (0,2,0)

local extvortextint



-- the matproxy that makes the tint possible

matproxy.Add({

name = "TARDIS_Interior_WindowTint",

init = function( self, mat, values )

self.ResultTo = values.resultvar


end,

    bind = function( self, mat, ent )

    if not ent.interior then return end  -- spews errors if tardis not existing

    local door = ent.interior.parts.door

    local animtime = ent.interior.metadata.Interior.IntDoorAnimationTime or ent.interior.metadata.Exterior.DoorAnimationTime


-- setup tint colors

    if ent.exterior:GetData("CustomVortexEnabled", false) == false then  -- use extension's default tint color from metadata
    vortex = ent.interior.metadata.Interior.WindowTint.Vortex
    end

    if ent.exterior:GetData("CustomVortexEnabled", false) == true then  -- enable vortex swap tint
    vortex = ent.exterior:GetData("VortexTintColor",nil)  -- get the color from vortexswitch.lua
    end

    local rawtint = door.windowtintcolor

    local tintmultiplier = ent.interior.metadata.Interior.WindowTint.TintMult

    local envtint = (rawtint * tintmultiplier)

    if ent.exterior:GetData("vortex",false) == false then  -- if not in vortex
    dark = (rawtint * 0.4)
    end

    if ent.exterior:GetData("vortex",false) == true then  -- if in vortex
    dark = (vortex * 0.4)
    end

    local wmdph = ent.exterior.metadata.Exterior.Teleport


-- window tint fade speeds; phase = base animation speed, factor = multiplier for adjustment

    local DoorSpeedMult = ent.interior.metadata.Interior.WindowTint.DoorSpeedMult  -- retroactively added to adjust for different anim speeds
    local DoorSpeedMultClosed = ent.interior.metadata.Interior.WindowTint.DoorSpeedMultClosed


if not ent:GetData("doorstatereal",false) then -- door closing
    factor = 1 * DoorSpeedMultClosed
    phase = 0.5
    targettint = envtint
end


if ent:GetData("demat",false) then  -- when dematting
if ent.exterior:GetFastRemat() and ent.exterior:GetMatHop() then
    factor = 0.36
    phase = wmdph.SequenceSpeedVeryFast
    targettint = vortex
elseif ent.exterior:GetFastRemat() then
    factor = 8
    phase = wmdph.SequenceSpeedFast
    targettint = vortex
else
    factor = 10.13
    phase = istable(wmdph.SequenceSpeed) and wmdph.SequenceSpeed.Demat or wmdph.SequenceSpeed
    targettint = vortex
end
end


if ent:GetData("vortex",false) then  -- in vortex
    factor = 2
    phase = 1
    targettint = vortex
end


if ent:GetData("mat",false) then  -- when matting
if ent.exterior:GetFastRemat() and ent.exterior:GetMatHop() then
    factor = 0.36
    phase = wmdph.SequenceSpeedVeryFast
    targettint = envtint
elseif ent.exterior:GetFastRemat() then
    factor = 8
    phase = wmdph.SequenceSpeedFast
    targettint = envtint
else
    factor = 16
    phase = istable(wmdph.SequenceSpeed) and wmdph.SequenceSpeed.Mat or wmdph.SequenceSpeed
    targettint = envtint
end
end


if ent:GetData("doorstatereal",false) then  -- door opening
    factor = 0.5 * DoorSpeedMult
    phase = 0.5
    targettint = dark
end

    if GetConVar("tardis2_debug"):GetBool() == true then
    targettint = Color(29,58,187):ToVector()*3  -- for debugging, interior window tint color
    end

-- window tint fade calculations

    local frac = FrameTime() / (factor * phase)


    local diffx = targettint.x - curtint.x
    local diffy = targettint.y - curtint.y
    local diffz = targettint.z - curtint.z


    local progx = diffx * frac
    local progy = diffy * frac
    local progz = diffz * frac


    local appliedtintx = curtint.x + progx
    local appliedtinty = curtint.y + progy
    local appliedtintz = curtint.z + progz



    local appliedtint = Vector(appliedtintx, appliedtinty, appliedtintz)


-- finally, apply to the window texture

    mat:SetVector ( self.ResultTo, (appliedtint) )

    curtint = appliedtint

    end
})

----------------------------------------------------------------------------------------------------------------------------------------------

matproxy.Add({

name = "TARDIS_Exterior_WindowTint",

init = function( self, mat, values )

self.ResultTo = values.resultvar


end,

    bind = function( self, mat, ent )

    if not ent then return end


    if ent:GetData("CustomVortexEnabled",false) == false then  -- use extension's default exterior tint color from metadata
    extvortextint = ent.interior.metadata.Interior.WindowTint.ExtTint
    end

    if ent:GetData("CustomVortexEnabled",false) == true then  -- enable vortex swap tint
    extvortextint = ent:GetData("VortexExtColor",nil)  -- exterior tint color
    end

    if GetConVar("tardis2_debug"):GetBool() == true then
    extvortextint = Color(23,72,206):ToVector()  -- for debugging, exterior window tint + vortex light shine color
    end


        if extvortextint then

        if (LocalPlayer():GetTardisData("interior") == nil) and (not ent:GetData("VortexEVA", false) == true) then
            extvortextint = Vector(0,0,0)
        end

    local appliedtintext = Vector(extvortextint.x, extvortextint.y, extvortextint.z)


-- finally, apply to the window texture

    mat:SetVector ( self.ResultTo, (appliedtintext) )
        end
    end
})
--     mat:SetFloat (self.ResultTo2, (ent.exterior:GetWindowTint() and 1 or 0) )
--     local appliedtintx = Lerp( normalizedx, curtint.x, targettint.x )
--     local appliedtinty = Lerp( normalizedy, curtint.y, targettint.y )
--     local appliedtint z = Lerp( normalizedz, curtint.z, targettint.z )
-- print (curtint)
-- print (CurTime())


--     local function lerptint(time, current, target)
--
--         local duration = 2
--
--         local frac = math.Clamp(time / duration, 0, 1)
--
--         return (1 - frac) * current + frac * target
--
--     end
--
--
--     local appliedtintx = lerptint(0.2, curtint.z, targettint.z)

-- target - cur = diff
--
-- diff * frac = rel prog
--
--
--
-- cur + rel prog  = tint


--     local appliedtintx = Lerp( (curtint.x), (targettint.x), FrameTime() * ( (factor * phase) / animtime) )
-- local cust = 0.001
--
--     local deltax = math.abs(targettint.x - curtint.x)
--     local deltay = math.abs(targettint.y - curtint.y)
--     local deltaz = math.abs(targettint.z - curtint.z)
--
--     local normalizedx = (cust / deltax)
--     local normalizedy = (cust / deltay)
--     local normalizedz = (cust / deltaz)

--     local tx = cust / durationx
--     local ty = cust / durationy
--     local tz = cust / durationz
-- print (durationx)

-- if tx >= 1 then
-- return end
-- print (deltax)
--











