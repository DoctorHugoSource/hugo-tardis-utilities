
    function ENT:GetDematLeave()
        return self:GetData("dematleave",false)
    end



    function ENT:SetDematLeave(on)
        self:SetData("dematleave",on,true)
        return true
    end



    function ENT:ToggleDematLeave()
        local on = not self:GetDematLeave()
        return self:SetDematLeave(on)
    end

----------------------------------------------------------------------------------------------------------------------------------------------

    function ENT:GetKeyReposition()
        return self:GetData("keyreposition",false)
    end



    function ENT:SetKeyReposition(on)
        self:SetData("keyreposition",on,true)
        return true
    end



    function ENT:ToggleKeyReposition()
        local on = not self:GetKeyReposition()
        return self:SetKeyReposition(on)
    end

----------------------------------------------------------------------------------------------------------------------------------------------

    function ENT:GetMapTravel()
        return self:GetData("maptravel",false)
    end



    function ENT:SetMapTravel(on)
        self:SetData("maptravel",on,true)
        return true
    end



    function ENT:ToggleMapTravel()
        local on = not self:GetMapTravel()
        return self:SetMapTravel(on)
    end

----------------------------------------------------------------------------------------------------------------------------------------------

    function ENT:GetTargetMap()
        return self:GetData("targetmap",nil)
    end



    function ENT:SetTargetMap(map)
        self:SetData("targetmap",map,true)
        return true
    end

----------------------------------------------------------------------------------------------------------------------------------------------

    function ENT:GetWindowTint()
        return self:GetData("windowtint",false)
    end



    function ENT:SetWindowTint(on)
        self:SetData("windowtint",on,true)
        return true
    end



    function ENT:ToggleWindowTint()
        local on = not self:GetWindowTint()
        return self:SetWindowTint(on)
    end

----------------------------------------------------------------------------------------------------------------------------------------------

    function ENT:GetVortexDrift()
        return self:GetData("vortexdrift",true)  -- starts enabled, disabled = no vortex drift (aka 'vortex drift compensators enabled')
    end



    function ENT:SetVortexDrift(on)
        self:SetData("vortexdrift",on,true)
        return true
    end



    function ENT:ToggleVortexDrift()
        local on = not self:GetVortexDrift()
        return self:SetVortexDrift(on)
    end

    ----------------------------------------------------------------------------------------------------------------------------------------------

    function ENT:GetMultiloopStabiliser()
        return self:GetData("multiloopstabiliser",true)  -- name of this control is not made up, it's a canon thing (source: type 40 manual page 58)
    end



    function ENT:SetMultiloopStabiliser(on)
        self:SetData("multiloopstabiliser",on,true)
        return true
    end



    function ENT:ToggleMultiloopStabiliser()
        local on = not self:GetMultiloopStabiliser()
        return self:SetMultiloopStabiliser(on)
    end

    ----------------------------------------------------------------------------------------------------------------------------------------------

    function ENT:GetFastVortexRemat()
        return self:GetData("fastvortexremat",false)  -- name of this control is not made up, it's a canon thing (source: type 40 manual page 58)
    end



    function ENT:SetFastVortexRemat(on)
        self:SetData("fastvortexremat",on,true)
        return true
    end



    function ENT:ToggleFastVortexRemat()
        local on = not self:GetFastVortexRemat()
        return self:SetFastVortexRemat(on)
    end