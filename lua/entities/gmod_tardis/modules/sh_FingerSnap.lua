
local SDelay = 0

function TardisFingerSnap(ply)

    if CurTime() < SDelay then return end

    if IsValid(jazztardis) then
        if ply == jazztardis:GetCreator() then

            ply:EmitSound( "hugo/tardis/snap.wav" )

            timer.Simple(0.3, function()

            jazztardis:ToggleDoor()

            SDelay = ( CurTime() + 2 )

            end)

        end
    end
end





-- local WDelay = 0
--
--
-- local function tpfix()
--
-- local ply = Entity(1)
--
-- WWWWoldpos = ply:GetPos()
--
-- ply:SetPos(Vector(0,0,0))
--
--
--
--
-- end



--             tpfix()
-- gghhhfffg = true
--                 WDelay = ( CurTime() + FrameTime() )
--     ENT:AddHook("Think", "tpfix", function(self)
-- if gghhhfffg == true then
--
--         if CurTime() < WDelay then return end
--         local ply = self:GetCreator()
-- ply:SetPos(WWWWoldpos)
--
-- end
-- gghhhfffg = false
--
-- end)
