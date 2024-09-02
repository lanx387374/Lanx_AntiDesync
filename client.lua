function detectHeadshot()
    local playerPed = PlayerPedId()
    local hit, hitEntity, hitCoords, hitNormal, hitDamage = GetEntityPlayerIsFreeAimingAt(playerPed)

    if hit and hitEntity then
        if IsPedAPlayer(hitEntity) then
            local boneIndex = GetPedBoneIndex(hitEntity, 31086) -- Head bone index

            local hitCoord = GetPedBoneCoords(hitEntity, boneIndex)

            if Vdist(hitCoords.x, hitCoords.y, hitCoords.z, hitCoord.x, hitCoord.y, hitCoord.z) < 0.5 then
                local playerId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(hitEntity))
                TriggerServerEvent('headshot:applyDamage', playerId)
            end
        end
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        detectHeadshot()
    end
end)
