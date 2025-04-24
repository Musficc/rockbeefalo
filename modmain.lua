Assets = {
    Asset("ANIM", "anim/rockbeefalo_actions_bank.zip"),
    Asset("SOUNDPACKAGE", "sound/rockbeefalo.fev"),
	Asset("SOUND", "sound/rockbeefalo.fsb"),
}

local useVanillaSound = GetModConfigData("VANILLA_SOUND")
if not useVanillaSound then RemapSoundEvent("dontstarve/beefalo/curious", "rockbeefalo/beefalo/curious")
else RemapSoundEvent("dontstarve/beefalo/curious", "dontstarve/beefalo/curious") end

AddPrefabPostInit("beefalo", function(inst)
    local lastBank = "beefalo"
    
    local function UpdateBank(inst)
        if not (inst and inst:IsValid()) then
            return
        end

        local animState = inst.AnimState
        if not animState then
            return
        end

        local newBank = animState:IsCurrentAnimation("alert_idle") and "rockbeefalo" or "beefalo"

        if newBank ~= lastBank then
            animState:SetBank(newBank)
            lastBank = newBank
        end
    end

    inst:ListenForEvent("animover", UpdateBank)
    inst:ListenForEvent("newstate", UpdateBank)
end)
