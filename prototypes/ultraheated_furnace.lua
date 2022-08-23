local data_util = require("data_util")

local ultra_heated_furnace_entity = table.deepcopy(data.raw["assembling-machine"]["industrial-furnace"])
local ultra_heated_furnace_item = table.deepcopy(data.raw["item"]["industrial-furnace"])

ultra_heated_furnace_item.name = data_util.mod_prefix .. "ultra-heated-furnace"
ultra_heated_furnace_item.icon = "__space-exploration-stuff__/graphics/icons/ultra-heated-furnace.png"
ultra_heated_furnace_item.place_result = data_util.mod_prefix .. "ultra-heated-furnace"

ultra_heated_furnace_entity.name = data_util.mod_prefix .. "ultra-heated-furnace"
ultra_heated_furnace_entity.icon = "__space-exploration-stuff__/graphics/icons/ultra-heated-furnace.png"
ultra_heated_furnace_entity.animation.layers[1].filename = "__space-exploration-stuff__/graphics/entity/ultra-heated-furnace/ultra-heated-furnace.png"
ultra_heated_furnace_entity.minable.result = data_util.mod_prefix .. "ultra-heated-furnace"
-- ultra_heated_furnace.energy_usage = data.raw["assembling-machine"]["industrial-furnace"].energy_usage * 10
-- ultra_heated_furnace.crafting_categories = {"ultra-heated-smelting"}
ultra_heated_furnace_entity.energy_source = {
    type = "heat",
    emissions_per_minute = 0,
    min_working_temperature = 5000,
    max_temperature = 10000,
    specific_heat = "1MJ",
    max_transfer = "1GW",
    connections = {
        {
            position = {-2, -2},
            direction = 0
        },
        {
            position = {-2, -2},
            direction = 6
        },
        {
            position = {-2, 2},
            direction = 6
        },
        {
            position = {-2, 2},
            direction = 4
        },
        {
            position = {2, 2},
            direction = 4
        },
        {
            position = {2, 2},
            direction = 2
        },
        {
            position = {2, -2},
            direction = 2
        },
        {
            position = {2, -2},
            direction = 0
        },
    }
}


data:extend(
{
    ultra_heated_furnace_entity,
    ultra_heated_furnace_item,
})