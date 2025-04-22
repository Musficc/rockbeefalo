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
    local function UpdateBank(inst)
        if inst:IsValid() and inst.AnimState then
            local newBank = inst.AnimState:IsCurrentAnimation("alert_idle") and "rockbeefalo" or "beefalo"
            if newBank ~= lastBank then
                inst.AnimState:SetBank(newBank)
                lastBank = newBank
            end
        end
    end
    inst:ListenForEvent("animover", UpdateBank)
    inst:ListenForEvent("newstate", UpdateBank)
end)