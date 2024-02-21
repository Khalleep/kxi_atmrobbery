lib.locale()

RegisterNetEvent('khalexi_atmrob:payout')
AddEventHandler('khalexi_atmrob:payout', function()
    local amount = math.random(K.MinAmount, K.MaxAmount)
    local src = source
    ox_inventory:AddItem(src, K.Reward, amount)
    TriggerClientEvent('ox_lib:notify', src, {
        type = 'success',
        description = locale('yougot', amount)
    })
end)