ESX = nil -- Déclaration du framework ESX

Citizen.CreateThread(function()
    while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 
    Citizen.Wait(5000)
    end
end)

-- Menu LTD
local LTD = {
    Base = { Header = {"root_cause", "shopui_title_24-7"}, Color = {color_black} },
    Data = { currentMenu = "Articles disponibles:"},
    Events = {
        onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
			local slide = btn.slidenum
			local btn = btn.name
			local check = btn.unkCheckbox
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
			local playerPed = PlayerPedId()
            		local coords = GetEntityCoords(playerPed)
        
            if btn == "Pain" then
                TriggerServerEvent("shops:buyitem", "pain", 1, 7)
            elseif btn == "Eau" then
        	TriggerServerEvent("shops:buyitem", "eau", 1, 6)
            elseif btn == "Téléphone" then
        	TriggerServerEvent("shops:buyitem", "phone", 1, 250)
            end
        end
    },

    Menu = {
        ["Articles disponibles:"] = {
            b = {
                {name = "Pain", ask = "~g~$7", askX = true},
                {name = "Eau", ask = "~g~$6", askX = true},
                {name = "Téléphone", ask = "~g~$250", askX = true},
            }
        },
    }
}
-- Positions des frigos
local ltdpoz = {
    {x = -715.71, y = -909.18, z = 19.22},
    {x = 1707.31, y = 4928.2, z = 42.06}
}
-- Position des blips
local blipsltds = {
    {x = -716.56, y = -921.58, z = 19.01}
}

local blipsltdn = {
    {x = 1694.28, y = 4930.89, z = 42.08}
}


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for w in pairs(ltdpoz) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, ltdpoz[w].x, ltdpoz[w].y, ltdpoz[w].z)

            if dist <= 1.7 then
                ESX.ShowHelpNotification('Appuyez ~INPUT_PICKUP~ pour accéder au ~b~frigo~s~.')
                if IsControlJustPressed(1, 51) then
                    CreateMenu(LTD)
		end
            end
        end
    end
end)

Citizen.CreateThread(function()
	for _, pos in pairs(blipsltds) do
        blips = AddBlipForCoord(pos.x, pos.y, pos.z)
        SetBlipSprite(blips, 52)
        SetBlipScale(blips, 0.7)
        SetBlipDisplay(blips, 4)
        SetBlipColour(blips, 1)
        SetBlipAsShortRange(blips, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("LTD South")
        EndTextCommandSetBlipName(blips)
    end
end)

Citizen.CreateThread(function()
	for _, pos in pairs(blipsltdn) do
        blips = AddBlipForCoord(pos.x, pos.y, pos.z)
        SetBlipSprite(blips, 52)
        SetBlipScale(blips, 0.7)
        SetBlipDisplay(blips, 4)
        SetBlipColour(blips, 1)
        SetBlipAsShortRange(blips, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("LTD North")
        EndTextCommandSetBlipName(blips)
    end
end)
