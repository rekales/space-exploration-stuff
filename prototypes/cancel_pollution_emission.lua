local data_util = require("data_util")

local pollution_absorber_tile = table.deepcopy(data.raw["tile"]["concrete"])
pollution_absorber_tile.name = data_util.mod_prefix .. "pollution-absorber"
pollution_absorber_tile.pollution_absorption_per_second = 0.000008

data:extend({pollution_absorber_tile})


local pollution_absorber_entity = 
{
    name = data_util.mod_prefix .. "pollution-absorber",
    type = "simple-entity",
    icon = "__base__/graphics/icons/wooden-chest.png",
    icon_size = 64,
    flags = {"placeable-neutral", "not-repairable"},
    subgroup = "grass",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    collision_mask = {"doodad-layer"},
    -- pictures = data.raw["container"]["wooden-chest"].picture,
    pictures = 
    {
        filename = "__space-exploration-graphics__/graphics/blank.png",
        width = 64,
        height = 64,
    },
    emissions_per_second = -10000,
    resistances = {
        { type = "physical", percent = 100 },
        { type = "impact", percent = 100 },
        { type = "poison", percent = 100 },
        { type = "explosion", percent = 100 },
        { type = "fire", percent = 100 },
        { type = "laser", percent = 100 },
        { type = "acid", percent = 100 },
        { type = "electric", percent = 100 }
    },
    selectable_in_game = false,
    max_health = 10000,
    heal_per_tick = 10000,
    render_layer = "floor"
}

data:extend({pollution_absorber_entity})

--hey dipshit, file a bug report about tile pollution absorbtion defaulting to 0.000003