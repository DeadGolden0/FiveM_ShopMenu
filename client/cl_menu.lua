--------------- Menu Initialiser ------------------------
--RMenu.Add('showcase', 'MainMenu', RageUI.CreateMenu("Épicerie", 'Sélectionner une catégorie', nil, nil, "commonmenu", "gradient_bgd", 150, 255, 0))
RMenu.Add('showcase', 'MainMenu', RageUI.CreateMenu("SUPERMARKET", 'Sélectionner une catégorie'))
RMenu:Get('showcase', 'MainMenu'):SetRectangleBanner(18, 79, 8 , 255)
RMenu:Get('showcase', 'MainMenu').EnableMouse = false

RMenu.Add('showcase', 'Nourritures', RageUI.CreateSubMenu(RMenu:Get('showcase','MainMenu'),"SUPERMARKET", 'Menu de vente - Nourritures'))
RMenu.Add('showcase', 'Boissons', RageUI.CreateSubMenu(RMenu:Get('showcase','MainMenu'),"SUPERMARKET", 'Menu de vente - Boissons'))
RMenu.Add('showcase', 'Autres', RageUI.CreateSubMenu(RMenu:Get('showcase','MainMenu'),"SUPERMARKET", 'Menu de vente - Autres'))


local Numbers = {}
Citizen.CreateThread(function()
    for i = 1, Config.MaxItem do
        table.insert(Numbers, i)
    end
end)

--------------- Main Menu ------------------------
RageUI.CreateWhile(1.0, function()
    if RageUI.Visible(RMenu:Get('showcase', 'MainMenu')) then
        RageUI.DrawContent({ header = true, glare = true, instructionalButton = true }, function()

            RageUI.Button("🍔 - Nourriture", nil, {RightLabel = "→→→"},true, function() 
            end, RMenu:Get('showcase', 'Nourritures'))

            RageUI.Button("🍹 - Boissons", nil, {RightLabel = "→→→"},true, function() 
            end, RMenu:Get('showcase', 'Boissons'))

            RageUI.Button("💻 - Autres", nil, {RightLabel = "→→→"},true, function() 
            end, RMenu:Get('showcase', 'Autres'))

        end, function()
        end)
    end

    --------------- Under Menu ------------------------
    -- Foods
    if RageUI.Visible(RMenu:Get('showcase', 'Nourritures')) then
        RageUI.DrawContent({ header = true, glare = true, instructionalButton = true }, function()

            for k, v in pairs(Config.Shop.Nourritures) do
                RageUI.List(v.Icon.. " - ".. v.Label .. ' (~g~'.. v.Price .. '$~s~)', Numbers, v.Index, nil, { }, true, function(hovered, active, selected, Index)
                    v.Index = Index
    
                    if selected then
                        local item = v.Value
                        local count = Numbers[Index]
                        local price = v.Price * count
    
                        TriggerServerEvent('Shop:giveItem', v, count)
                    end
                end)
            end

        end, function()
        end)
    end

    -- Drinks
    if RageUI.Visible(RMenu:Get('showcase', 'Boissons')) then
        RageUI.DrawContent({ header = true, glare = true, instructionalButton = true }, function()

            for k, v in pairs(Config.Shop.Boissons) do
                RageUI.List(v.Icon.. " - ".. v.Label .. ' (~g~'.. v.Price .. '$~s~)', Numbers, v.Index, nil, { }, true, function(hovered, active, selected, Index)
                    v.Index = Index
    
                    if selected then
                        local item = v.Value
                        local count = Numbers[Index]
                        local price = v.Price * count
    
                        TriggerServerEvent('Shop:giveItem', v, count)
                    end
                end)
            end

        end, function()
        end)
    end

    -- Other
    if RageUI.Visible(RMenu:Get('showcase', 'Autres')) then
        RageUI.DrawContent({ header = true, glare = true, instructionalButton = true }, function()

            for k, v in pairs(Config.Shop.Autres) do
                RageUI.List(v.Icon.. " - ".. v.Label .. ' (~g~'.. v.Price .. '$~s~)', Numbers, v.Index, nil, { }, true, function(hovered, active, selected, Index)
                    v.Index = Index
    
                    if selected then
                        local item = v.Value
                        local count = Numbers[Index]
                        local price = v.Price * count
    
                        TriggerServerEvent('Shop:giveItem', v, count)
                    end
                end)
            end

        end, function()
        end)
    end

end, 1)