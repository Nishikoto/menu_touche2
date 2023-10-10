-- Créer par Nishikoto
-- https://github.com/Nishikoto
-- With ❤️

local stats = false
local menu = RageUI.CreateMenu(Config.title, Config.subtitle, Config.pos.x, Config.pos.y, Config.textures.dict, Config.textures.name)

local _menu = function()
    if stats then
        return
    end
    stats = true
    CreateThread(function()
        RageUI.Visible(menu, true)
        while stats do
            RageUI.IsVisible(menu, function()
                for _,v in pairs(Config.List) do
                    RageUI.Button(v.label, v.description, {RightLabel = v.rightlabel}, true, {})
                end
            end)
        Wait(1)
        end
    end)
end

RegisterCommand(Config.command, function()
    _menu()
end)
RegisterKeyMapping(Config.command, 'Menu Touche par Nishikoto', 'keyboard', Config.bind)