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
               -- you can change the notify here :)
                TriggerClientEvent('esx:showNotification', playerId, 'تم قتل اللاعب بسبب تلقيه إصابة في الرأس!')
            end
        end
    end
end)
