Assets = {
    Asset("ANIM", "anim/rockbeefalo_actions_bank.zip"),
    Asset("SOUNDPACKAGE", "sound/rockbeefalo.fev"),
	Asset("SOUND", "sound/rockbeefalo.fsb"),
}


RemapSoundEvent("dontstarve/beefalo/curious", "rockbeefalo/beefalo/curious")

AddPrefabPostInit("beefalo", function(inst)
    inst:DoPeriodicTask(0.1, function()
        if inst.AnimState:IsCurrentAnimation("alert_idle") then
            inst.AnimState:SetBank("rockbeefalo")
        else
            inst.AnimState:SetBank("beefalo")
        end
    end)
end)