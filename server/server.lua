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

    -- Discord Webhook Logging
    local webhookData = {
        content = "**KXI ATM Robbery Payout:**",
        embeds = {
            {
                title = "Details",
                description = "ATM robbery reported.",
                fields = {
                    {name = "Player ID", value = tostring(src)},
                    {name = "Amount", value = tostring(amount)},
                    {name = "Reward Item", value = tostring(K.Reward)}
                },
                color = 000080
            }
        }
    }

    PerformHttpRequest('YOUR_DISCORD_WEBHOOK_URL_HERE', function(err, text, headers) end, 'POST', json.encode(webhookData), { ['Content-Type'] = 'application/json' })

end)
