lib.locale()

RegisterNetEvent('khalexi_atmrob:payout')
AddEventHandler('khalexi_atmrob:payout', function()
    local src = source
    
    -- Let's verify that the player is a local player and not, for example, a message sent by someone else.
    if not src or type(src) ~= 'number' or src < 1 then
        print("Error player")
        return
    end

    -- Let's check that the number is valid
    if not K.MinAmount or not K.MaxAmount or K.MinAmount > K.MaxAmount then
        print("Invalid settings!")
        return
    end

    -- Preventing giving too much in quantity.
    local amount = math.random(K.MinAmount, K.MaxAmount)

    -- Adding the prize to the player's assets.
    ox_inventory:AddItem(src, K.Reward, amount)

    TriggerClientEvent('ox_lib:notify', src, {
        type = 'success',
        description = lib.locale('yougot', amount)
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
