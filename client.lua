Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)

        local playerPed = PlayerPedId()

        if IsPedInAnyVehicle(playerPed, false) then
            local vehicle = GetVehiclePedIsIn(playerPed, false)

            if GetPedInVehicleSeat(vehicle, -1) == playerPed then
                local vehicleModel = GetEntityModel(vehicle)
                local modsToEnforce = nil

                for modelName, mods in pairs(Config_vehicleModConfig) do
                    if GetHashKey(modelName) == vehicleModel then
                        modsToEnforce = mods
                        break 
                    end
                end

                if modsToEnforce then
                    SetVehicleModKit(vehicle, 0)

                    for _, modType in ipairs(modsToEnforce) do
                        if GetVehicleMod(vehicle, modType) == -1 then
                            SetVehicleMod(vehicle, modType, 0, false)
                        end
                    end
                end
            end
        end
    end
end)

-- Register the command that players will use
RegisterCommand('getmods', function(source, args, rawCommand)
    -- Get the player's character
    local playerPed = PlayerPedId()
    
    -- Check if the player is in a vehicle
    if IsPedInAnyVehicle(playerPed, false) then
        -- Get the vehicle the player is in
        local vehicle = GetVehiclePedIsIn(playerPed, false)

        -- You must set the vehicle's mod kit to 0 to properly read its mods.
        SetVehicleModKit(vehicle, 0)
        
        print('--- Vehicle Mod Information ---')
        
        -- Loop through all possible mod types (0 to 50 is a safe range for all mods)
        for modType = 0, 50 do
            -- Get the number of available options for the current mod type
            local modCount = GetNumVehicleMods(vehicle, modType)
            
            -- If there is at least one option for this mod type, print it
            if modCount > 0 then
                -- The modIndex is zero-based, so a count of 2 means index 0 and 1 are available.
                print('Mod Type: ' .. modType .. ' | Available Options: ' .. modCount .. ' (Index 0 to ' .. (modCount - 1) .. ')')
            end
        end
        
        print('--- End of Information ---')

    else
        -- If the player is not in a vehicle, notify them
        print('You must be inside a vehicle to use this command.')
    end
end, false) -- 'false' means anyone can use this command

print('[/getmods] command loaded successfully. Get in a vehicle and type /getmods to see its available mods.')