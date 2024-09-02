local checkInterval = 1000 

function detectHeadshot()
    local playerPed = PlayerPedId()

    if IsPedAiming(playerPed) or IsPedShooting(playerPed) then
        local isAiming, hitEntity, hitCoords = GetEntityPlayerIsFreeAimingAt(playerPed)

        if isAiming and hitEntity and IsPedAPlayer(hitEntity) then
            local boneIndex = GetPedBoneIndex(hitEntity, 31086) 
            local headPosition = GetWorldPositionOfEntityBone(hitEntity, boneIndex)

            if IsPointInPolygon(hitCoords, headPosition) then
                local playerId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(hitEntity))
                TriggerServerEvent('headshot:applyDamage', playerId)
            end
        end
    end
end

function IsPointInPolygon(point, polygon)
    local distance = Vdist(point.x, point.y, point.z, polygon.x, polygon.y, polygon.z)
    return distance < 0.2 
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(checkInterval) 
        detectHeadshot()
    end
end)
