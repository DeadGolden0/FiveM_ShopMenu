Config = {}

-- Config Buttons
-- https://docs.fivem.net/docs/game-references/controls/
Config.Button = 51 -- Default E
Config.DrawButton = "E" -- Change the key that will be displayed at the bottom of the screen

-- DrawMarker
-- https://docs.fivem.net/docs/game-references/markers/
Config.UseMarker = false
Config.TypeMarker = 29
Config.Distance = 10.0 

-- Blip(s)
-- https://docs.fivem.net/docs/game-references/blips/
Config.TypeBlip = 52
Config.BlipColor = 2

-- Shop(s) and Item(s)
Config.MaxItem = 10
Config.Shop = {
    Positions = {
	    {name = 'Épicerie', x = 25.947, y = -1345.502, z = 29.497}
	},
    Nourritures = {
        -- No Limit
        {Icon = '🥖', Label = 'Pain', Value = 'bread', Price = 200, Index = 1},
        {Icon = '🐟', Label = 'Poisson', Value = 'fish', Price = 300, Index = 1},
        {Icon = '🐔', Label = 'Poulet', Value = 'slaughtered_chicken', Price = 500, Index = 1},
        {Icon = '🐷', Label = 'Cochon', Value = 'packaged_chicken', Price = 600, Index = 1},
        {Icon = '🍡', Label = 'Dango', Value = 'clothe', Price = 100, Index = 1}
    },
    Boissons = {
        -- No Limit
        {Icon = '💦', Label = 'Eau', Value = 'water', Price = 300, Index = 1},
        {Icon = '🍹', Label = 'Ice Tea', Value = 'icetea', Price = 150, Index = 1}
    },
    Autres = {
        -- No Limit
        {Icon = '📱', Label = 'Telephone', Value = 'phone', Price = 450, Index = 1},
        {Icon = '🌿', Label = 'Cannabis', Value = 'cannabis', Price = 500, Index = 1},
        {Icon = '🩹', Label = 'Bandage', Value = 'bandage', Price = 100, Index = 1},
        {Icon = '💎', Label = 'Diamant', Value = 'diamond', Price = 1000, Index = 1}
    }
}