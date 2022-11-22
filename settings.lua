--startup settings
local data_util = require("data_util")

data:extend{
    {
        type = "bool-setting",
        name = data_util.mod_prefix .. "antimatter-rocket-fuel",
        setting_type = "startup",
        default_value = true,
        order = "a"
    },
    {
        type = "bool-setting",
        name = data_util.mod_prefix .. "bioplastic",
        setting_type = "startup",
        default_value = true,
        order = "b"
    },
    {
        type = "bool-setting",
        name = data_util.mod_prefix .. "biosludge-coal",
        setting_type = "startup",
        default_value = true,
        order = "c"
    },
    {
        type = "bool-setting",
        name = data_util.mod_prefix .. "matter-fusion-viability",
        setting_type = "startup",
        default_value = true,
        order = "d"
    },
    {
        type = "bool-setting",
        name = data_util.mod_prefix .. "methane-rocket-fuel",
        setting_type = "startup",
        default_value = true,
        order = "e"
    },
    {
        type = "bool-setting",
        name = data_util.mod_prefix .. "neutral-core-landfill",
        setting_type = "startup",
        default_value = true,
        order = "f"
    },
    {
        type = "bool-setting",
        name = data_util.mod_prefix .. "simplified-delivery-capsule",
        setting_type = "startup",
        default_value = true,
        order = "g"
    },
    {
        type = "bool-setting",
        name = data_util.mod_prefix .. "more-wdc-ammo",
        setting_type = "startup",
        default_value = true,
        order = "h"
    },
    {
        type = "bool-setting",
        name = data_util.mod_prefix .. "belt-uncoloring",
        setting_type = "startup",
        default_value = true,
        order = "i"
    },
    {
        type = "bool-setting",
        name = data_util.mod_prefix .. "cannonable-nuclear-fuel",
        setting_type = "startup",
        default_value = true,
        order = "j"
    },
    {
        type = "bool-setting",
        name = data_util.mod_prefix .. "vita-elevator-cable",
        setting_type = "startup",
        default_value = true,
        order = "k"
    },
    {
        type = "bool-setting",
        name = data_util.mod_prefix .. "anti-ore-regen",
        setting_type = "startup",
        default_value = false,
        order = "l"
    },
    {
        type = "bool-setting",
        name = data_util.mod_prefix .. "cancel-pollution-emission",
        setting_type = "startup",
        default_value = false,
        order = "m"
    },
    {
        type = "bool-setting",
        name = data_util.mod_prefix .. "pyroflux-hotter-steam",
        setting_type = "startup",
        default_value = true,
        order = "n"
    },
    {
        type = "bool-setting",
        name = data_util.mod_prefix .. "renewable-naquium",
        setting_type = "startup",
        default_value = true,
        order = "o"
    },
    {
        type = "bool-setting",
        name = data_util.mod_prefix .. "pollution-bioscrubbing",
        setting_type = "startup",
        default_value = true,
        order = "p"
    },
    {
        type = "bool-setting",
        name = data_util.mod_prefix .. "medpack-recoloring",
        setting_type = "startup",
        default_value = true,
        order = "q"
    },
    {
        type = "double-setting",
        name = data_util.mod_prefix .. "core-miner-speed-multiplier",
        setting_type = "startup",
        default_value = 1,
        minimum_value = 0.1,
        maximum_value = 10,
        order = "r"
    },
}



if mods["se-recycling-extras"]
then
    data.raw["bool-setting"][data_util.mod_prefix .. "belt-uncoloring"].default_value = false
end

--runtime global settings
-- if settings.startup[data_util.mod_prefix.."renewable-naquium"].value 
-- then
    data:extend{
        {
            type = "int-setting",
            name = data_util.mod_prefix .. "naquium-harvest-multiplier",
            setting_type = "runtime-global",
            default_value = 10,
            minimum_value = 1,
            maximum_value = 1000,
            order = "a"
        },
    }
-- end

