local cooldowns = {}

CreateThread(function()
    local models = {
        `prop_bin_01a`,
        `prop_bin_05a`,
        `prop_bin_06a`,
        `prop_bin_07a`,
        `prop_bin_08a`,
        `prop_bin_10a`,
        `prop_bin_11a`,
        `prop_dumpster_01a`,
        `prop_dumpster_02a`,
    }

    for _, model in pairs(models) do
        exports.ox_target:addModel(model, {
            {
                name = 'SN_bins_search',
                icon = 'fa-solid fa-magnifying-glass',
                label = 'Pengo roskista',
                distance = 2.0,

                canInteract = function(entity)
                    local lastSearch = cooldowns[entity]
                    return not lastSearch or (GetGameTimer() - lastSearch) > (5 * 60 * 1000)
                end,

                onSelect = function(data)
                    local entity = data.entity

                    local success = lib.progressCircle({
                        duration = 5000,
                        label = 'Pengotaan roskista...',
                        position = 'middle',
                        useWhileDead = false,
                        canCancel = true,
                        disable = {
                            move = true,
                            combat = true
                        },
                        anim = {
                            dict = 'amb@prop_human_bum_bin@idle_b',
                            clip = 'idle_d'
                        }
                    })

                    if not success then return end

                    cooldowns[entity] = GetGameTimer()
                    TriggerServerEvent('SN_bins:rewardPlayer')
                end
            }
        })
    end
end)