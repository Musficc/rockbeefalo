Assets = {
    Asset("ANIM", "anim/rockbeefalo_actions_bank.zip"),
    Asset("SOUNDPACKAGE", "sound/rockbeefalo.fev"),
    Asset("SOUND", "sound/rockbeefalo.fsb"),
}

local useVanillaSound = GetModConfigData("VANILLA_SOUND")
if not useVanillaSound then
    RemapSoundEvent("dontstarve/beefalo/curious", "rockbeefalo/beefalo/curious")
else
    RemapSoundEvent("dontstarve/beefalo/curious", "dontstarve/beefalo/curious")
end

AddPrefabPostInit("beefalo", function(inst)
    inst:DoPeriodicTask(0.01, function()
        if inst.AnimState:IsCurrentAnimation("alert_idle") then
            inst.AnimState:SetBank("rockbeefalo")
        else
            inst.AnimState:SetBank("beefalo")
        end
    end)
end)
