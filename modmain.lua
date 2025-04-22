Assets = {
    Asset("ANIM", "anim/rockbeefalo_actions_bank.zip"),
    Asset("SOUNDPACKAGE", "sound/rockbeefalo.fev"),
	Asset("SOUND", "sound/rockbeefalo.fsb"),
}

local remapSound = GetModConfigData("REMAP_SOUND")
if not remapSound then RemapSoundEvent("dontstarve/beefalo/curious", "rockbeefalo/beefalo/curious")
else RemapSoundEvent("rockbeefalo/beefalo/curious", "dontstarve/beefalo/curious") end

AddPrefabPostInit("beefalo", function(inst)
    local lastBank = "beefalo"

    inst:DoPeriodicTask(0.1, function()
        if not inst:IsValid() or not inst.AnimState then
            return
        end

        local anim = inst.AnimState
        local newBank = anim:IsCurrentAnimation("alert_idle") and "rockbeefalo" or "beefalo"
        if newBank ~= lastBank then
            anim:SetBank(newBank)
            lastBank = newBank
        end
    end)
end)