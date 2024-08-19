
hook.Add("EntityEmitSound", "TardisInteriorSoundTransferCl", function(data)

if SERVER then return end

local box = LocalPlayer():GetTardisData("interior")

if not box then return end

if IsValid(box) and IsValid(box.parts) then

    if data.Entity == box.parts.door then return end

    if data.Entity == box.exterior.parts.door then return end

    if data.Entity == LocalPlayer() then return end

    if data.Pos == nil then
    data.Pos = box.exterior.parts.door:WorldToLocal(Vector(0,50,0))
    end



        if box:DoorOpen() == false then return nil end

        local sndextpos = box.exterior.parts.door:WorldToLocal(data.Pos)

        local intsndpos = box.parts.door:LocalToWorld ( sndextpos )

        data.Pos = intsndpos

return true

end

end)


hook.Add("EntityEmitSound", "TardisInteriorSoundTransferSv", function(data)

if CLIENT then return end

local box = jazztardis

if not IsValid(box) then return end


    if data.Entity == box.parts.door then return end

    if data.Entity == box.exterior.parts.door then return end

    if data.Entity == box:GetCreator() then return end

    if data.Pos == nil then
    data.Pos = box.parts.door:WorldToLocal(Vector(0,50,0))
    end


        if box:DoorOpen() == false then return end

        local sndextpos = box.parts.door:WorldToLocal(data.Pos)

        local intsndpos = box.interior.parts.door:LocalToWorld ( sndextpos )

        data.Pos = intsndpos

return true


end)

-- hook.Add("EntityEmitSound", "sounddetect", function(data)
-- -- print (data.SoundName)
-- end)

