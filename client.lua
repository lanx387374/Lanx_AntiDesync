local checkInterval = 1000 

function detectHeadshot()
    local playerPed = PlayerPedId()

    if IsPedAiming(playerPed) or IsPedShooting(playerPed) then
        local isAiming, hitEntity, hitCoords = GetEntityPlayerIsFreeAimingAt(playerPed)

        if isAiming and hitEntity then
            if IsPedAPlayer(hitEntity) then
                local boneIndex = GetPedBoneIndex(hitEntity, 31086)
                local headPosition = GetWorldPositionOfEntityBone(hitEntity, boneIndex)

                if Vdist(hitCoords.x, hitCoords.y, hitCoords.z, headPosition.x, headPosition.y, headPosition.z) < 0.5 then
                    local playerId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(hitEntity))
                    TriggerServerEvent('headshot:applyDamage', playerId)
                end
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
