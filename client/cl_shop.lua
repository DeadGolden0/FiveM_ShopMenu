ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

-- Marker and Shop point
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerCoords = GetEntityCoords(PlayerPedId())

		for k, v in pairs(Config.Shop.Positions) do
			local distance = GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, true)

            if Config.UseMarker == true then
                if distance < Config.Distance then
				    DrawMarker(Config.TypeMarker, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.9, 0.9, 0.9, 0, 128, 255, 255, false, false, 2, false, nil, nil, false)
                end
            end

            if distance <= 1 then
                RageUI.Text({
                    message = "Appuyez sur [~b~"..Config.DrawButton.."~s~] pour accéder à l\'Épicerie",
                    time_display = 1
                })

                if IsControlJustPressed(1, Config.Button) then
                    RageUI.Visible(RMenu:Get('showcase', 'MainMenu'), not RageUI.Visible(RMenu:Get('showcase', 'MainMenu')))
                end
            end

            if distance > 1.5 then
                RageUI.CloseAll()
            end
		end
	end
end)

-- Map Blips
Citizen.CreateThread(function()
	for k, v in pairs(Config.Shop.Positions) do
		local blip = AddBlipForCoord(v.x, v.y, v.z)

     --- Blip on map 
		SetBlipSprite(blip, Config.TypeBlip)
		SetBlipScale (blip, 0.8)
		SetBlipColour(blip, Config.BlipColor)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName("Épicerie")
		EndTextCommandSetBlipName(blip)
	end
end)