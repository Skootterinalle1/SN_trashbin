
CreateThread(function()
    local resName = GetCurrentResourceName()

    if resName ~= "SN_bins" then
        print("^1[SN_bins] VIRHE: Resurssin kansion nimi EI ole 'SN_trashbins'.^0")
        print("^1[SN_bins] Resurssi sammutetaan...^0")
        StopResource(resName)
        return
    end

    print("^2[SN_bins] Version 1.0 | Made by skootterinalle1 | support for script | Discord: skootterinalle ✅^0")
end)


RegisterNetEvent('SN_bins:rewardPlayer', function()
    local src = source

    local roll = math.random(100)
    local cumulativeChance = 0
    local selectedItem = nil

    for _, loot in ipairs(Config.LootTable) do
        cumulativeChance = cumulativeChance + loot.chance

        if roll <= cumulativeChance then
            selectedItem = loot.item
            break
        end
    end

    if not selectedItem then
        print("^1[SN_bins] VIRHE: Loot-taulukko väärin config.lua:ssa.^0")
        return
    end


    local success = exports.ox_inventory:AddItem(src, selectedItem, 1)

    if success then
        TriggerClientEvent('ox_lib:notify', src, {
            title = "Löysit jotakin!",
            description = selectedItem,
            type = "success"
        })
    else
        print("^1[SN_bins] VIRHE: Ei voitu lisätä itemiä '" .. selectedItem .. "' inventoryyn.^0")
        TriggerClientEvent('ox_lib:notify', src, {
            title = "Virhe",
            description = "Ei voitu lisätä itemiä inventaariin",
            type = "error"
        })
    end
end)