local maxDistance = 50.0 

RegisterNetEvent('headshot:applyDamage')
AddEventHandler('headshot:applyDamage', function(playerId)
    local src = source
    local ped = GetPlayerPed(GetPlayerFromServerId(playerId))
    local shooterPed = GetPlayerPed(src)

    if ped and shooterPed and DoesEntityExist(ped) and DoesEntityExist(shooterPed) then
        local health = GetEntityHealth(ped)

        if health > 0 then
            local shooterCoords = GetEntityCoords(shooterPed)
            local targetCoords = GetEntityCoords(ped)
            local distance = #(shooterCoords - targetCoords) 

            if distance <= maxDistance then
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
