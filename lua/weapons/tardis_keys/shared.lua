AddCSLuaFile()

SWEP.Spawnable = true
SWEP.PrintName = "TARDIS Keys"
SWEP.Category = "Doctor Who - TARDIS"
SWEP.Author = "Gallifrey Black Hole Shipyard"
SWEP.AdminOnly = false
SWEP.UseHands = true

SWEP.Purpose = "Your personal TARDIS keys"
SWEP.Base = "weapon_base"

SWEP.ViewModel				= "models/molda/sonics/keysonic/c_keysonic.mdl"
SWEP.WorldModel				= "models/molda/sonics/keysonic/w_keysonic.mdl"
SWEP.ViewModelFOV		= 55


SWEP.Primary.Delay = 1
SWEP.Primary.ClipSize = 0
SWEP.Primary.DefaultClip = 0
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = ""

SWEP.Secondary.ClipSize = 0
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""

SWEP.Weight = 0
SWEP.AutoSwitchTo = true
SWEP.AutoSwitchFrom = false

SWEP.Slot = 0
SWEP.SlotPos = 0
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true

SWEP.RDelay = 0
SWEP.SDelay = 0
-- List this weapon in the store
-- local tardiskeys_test2 = jstore.Register(SWEP, 10, { type = "tool" })






----------------------------------------------------------------------------------------------------------------------------------------------

if CLIENT then return end

----------------------------------------------------------------------------------------------------------------------------------------------

function SWEP:PrimaryAttack()

    if self:GetOwner():GetTardisData("interior") then return end  -- actually dont accept inputs when inside because it would be really annoying if you hit a misinput

    if IsValid(jazztardis) then return end

        local ply = self:GetOwner()

  local spawnposjazztardis = ply:GetPos() + (ply:GetAngles():Forward() * 150 * Vector (1,1,0))   -- FINALLY a way to set an object on the ground
                                                                                               -- in front of the player

          local interior = file.Read ("tardiskey_selected_interior.txt", DATA )

          if IsValid(self) then
          interior = file.Read ("tardiskey_selected_interior.txt", DATA )
          end

        local customData = {
        metadataID = interior,
        pos = spawnposjazztardis,
        spawndemated = true
    }

    jazztardis = TARDIS:SpawnTARDIS(ply, customData, true)

    TARDIS:Message(self:GetOwner(), "You've summoned your TARDIS")
end

----------------------------------------------------------------------------------------------------------------------------------------------

local intcount = 0

function SWEP:SecondaryAttack()

    local interiortable = { -- figure out how to use a table to do this properly later
        [1] = default,
        [2] = hurt,
        [3] = toyota_2017_F,
        [4] = hartnelltardispilot,
        [5] = torrentturdis,
    }


    if self:GetOwner():KeyDown(IN_WALK) then  -- secondary altfire

        -- todo: rework this thing entirely because this is super bad and it's only here as a proof of concept

        -- allow tardis keys to swap personal interior
        local TARDISkeyselectedinterior = (intcount == 0 and "default")   -- todo: make this completely customizable eventually
        or (intcount == 1 and "hurt")
        or (intcount == 2 and "tardis2010_karmal")
        or (intcount == 3 and "toyota_2017_F")
        or (intcount == 4 and "hartnelltardispilot")
        or (intcount == 5 and "torrentturdis")



        local msg = (intcount == 0 and TARDIS:Message(self:GetOwner(), "Default Interior selected"))
        or (intcount == 1 and TARDIS:Message(self:GetOwner(), "War Doctor's Interior selected"))
        or (intcount == 2 and TARDIS:Message(self:GetOwner(), "2010 Interior selected"))
        or (intcount == 3 and TARDIS:Message(self:GetOwner(), "Capaldi's Interior selected"))
        or (intcount == 4 and TARDIS:Message(self:GetOwner(), "Hartnell's Interior selected"))
        or (intcount == 5 and TARDIS:Message(self:GetOwner(), "Sentinel Interior selected"))

        intcount = intcount + 1

        if intcount == 6 then
            intcount = 0
        end

        print (TARDISkeyselectedinterior)

        file.Write ("tardiskey_selected_interior.txt", TARDISkeyselectedinterior )

    else

        if self:GetOwner():GetTardisData("interior") then return end  -- actually dont accept inputs when inside because it would be really annoying if you hit a misinput

        if CurTime() < self.SDelay then return end

        if IsValid(jazztardis) then

        if jazztardis:GetData("demat") or jazztardis:GetFastRemat() then return end

            if IsValid(jazztardis) then

            jazztardis:SetDematLeave(true)
            jazztardis:Demat()


            self.SDelay = ( CurTime() + 4 )

            end
        end
    end
end

----------------------------------------------------------------------------------------------------------------------------------------------

function SWEP:Reload()    -- call tardis to your location, like the sonic can - but shortcut

if self:GetOwner():GetTardisData("interior") then return end  -- actually dont accept inputs when inside because it would be really annoying if you hit a misinput

if CurTime() < self.RDelay then return end  -- setup timer for 'fire rate'

    if IsValid(jazztardis) then  -- only works on personal tardis

    if jazztardis:GetData("demat") then return end

    local ply = self:GetOwner()

        if IsValid(jazztardis) then  -- this redundant? quite frankly fraid of removing anything before everything collapses


    local hopdestination = ply:GetPos() + (ply:GetAngles():Forward() * 150 * Vector (1,1,0))   -- FINALLY a way to set an object on the ground in
                                                                                                -- front of the player
    local hopangle = ply:EyeAngles()

                hopangle:RotateAroundAxis(hopangle:Up(), 180)
                local hopangletbl = hopangle:ToTable()           -- ALL of this is needed because angles cant be multiplied ARGHHH
                hopangletbl[1] = 0
                hopangletbl[3] = 0
                hopangle:SetUnpacked(hopangletbl[1], hopangletbl[2], hopangletbl[3])


            jazztardis:SetDestination(hopdestination, hopangle, true)  -- make it land infront of the player, facing them


            if jazztardis:GetData("vortex") then  -- if already in vortex, just mat it infront of you
            jazztardis:Mat()
            TARDIS:Message(self:GetOwner(), "You've called Your TARDIS to your location")
            else                               -- make it demat and automatically land for you

                local alreadyactive = jazztardis:GetFastRemat()

                if alreadyactive then
                    jazztardis:SetData("keyrecall_alreadyactive", true)
                end

                jazztardis:SetKeyReposition(true)
                    if not alreadyactive then
                    jazztardis:SetFastRemat(true)
                    end

            jazztardis:Demat()
            end


            self.RDelay = ( CurTime() + 4 )  -- basically the 'fire rate' of this function

        end
    end
end

----------------------------------------------------------------------------------------------------------------------------------------------
