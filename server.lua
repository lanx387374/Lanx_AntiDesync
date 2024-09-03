RegisterNetEvent('headshot:applyDamage')
AddEventHandler('headshot:applyDamage', function(playerId)
    local ped = GetPlayerPed(GetPlayerFromServerId(playerId))

    if ped and DoesEntityExist(ped) then
        local health = GetEntityHealth(ped)
        if health > 0 then
            local headshotDamage = 100 

            local newHealth = math.max(health - headshotDamage, 0)
            SetEntityHealth(ped, newHealth)

            if newHealth <= 0 then
                SetEntityHealth(ped, 0)
                
                -- Notify the player
                TriggerClientEvent('esx:showNotification', playerId, 'تم قتل اللاعب بسبب تلقيه إصابة في الرأس!')

                -- Discord logging
                local playerName = GetPlayerName(GetPlayerFromServerId(playerId))
                local webhookUrl = 'YOUR_DISCORD_WEBHOOK_URL'
                local message = {
                    ["username"] = "Headshot Logger",
                    ["content"] = "**" .. playerName .. "** تم قتله بسبب إصابة في الرأس!"
                }
                
                PerformHttpRequest(webhookUrl, function(err, text, headers) 
                end, 'POST', json.encode(message), { ['Content-Type'] = 'application/json' })
            end
        end
    end
end)
