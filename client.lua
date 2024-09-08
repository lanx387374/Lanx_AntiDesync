local checkInterval = 1000 

function detectHeadshot()
    local playerPed = PlayerPedId()

    if IsPedShooting(playerPed) then
        local _, hitEntity = GetEntityPlayerIsFreeAimingAt(PlayerId()) 

        if hitEntity and IsPedAPlayer(hitEntity) then
            local boneIndex = GetPedBoneIndex(hitEntity, 31086)  
            local headPosition = GetWorldPositionOfEntityBone(hitEntity, boneIndex)

            if HasEntityBeenDamagedByWeapon(hitEntity, GetSelectedPedWeapon(playerPed), 0) then
                local playerId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(hitEntity))
                TriggerServerEvent('headshot:applyDamage', playerId)
            end
        end
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(checkInterval) 
        detectHeadshot()
    end
end)
