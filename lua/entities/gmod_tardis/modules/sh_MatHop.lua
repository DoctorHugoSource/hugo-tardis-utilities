
    function ENT:GetMatHop()
        return self:GetData("mathop",false)
    end



    function ENT:SetMatHop(on)

        self:SetData("mathop",on,true)
        return true
    end



    function ENT:ToggleMatHop()
        local on = not self:GetMatHop()
        return self:SetMatHop(on)
    end

-----------------------------------------------------------------------------------------------------------------------------------------------

        function ENT:GetMatHopFail()
        return self:GetData("mathopfail",false)
    end



    function ENT:SetMatHopFail(on)

        self:SetData("mathopfail",on,true)
        return true
    end



    function ENT:ToggleMatHopFail()
        local on = not self:GetMatHopFail()
        return self:SetMatHopFail(on)
    end
