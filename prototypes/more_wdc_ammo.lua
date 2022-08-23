local data_util = require("data_util")

local wdc_prefix = "se-delivery-cannon-weapon-pack-"

---@param payload prototype type="ammo" or type="capsule"
---@param tech_unlock string
local function add_weapon_delivery_cannon_ammo(payload, tech_unlock)
    data:extend(
    {
        {
            name = "se-delivery-cannon-weapon-package-" .. payload.name,
            type = "item",
            subgroup = "ammo",
            icon = "__space-exploration-graphics__/graphics/icons/delivery-cannon-weapon-capsule.png",
            icon_size = 64,
            stack_size = 1,
        },
        {
            name = "se-delivery-cannon-weapon-pack-" .. payload.name,
            type = "recipe",
            icon = payload.icon,
            icon_size = payload.icon_size,
            category = "delivery-cannon-weapon",
            ingredients = {{name=payload.name, amount=1}, {name="se-delivery-cannon-weapon-capsule", amount=1}},
            result = "se-delivery-cannon-weapon-package-" .. payload.name,
            result_count = 1,
            energy_required = 20,
            enabled = false,
        },
    })
    table.insert(data.raw["technology"][tech_unlock].effects, {type="unlock-recipe", recipe="se-delivery-cannon-weapon-pack-"..payload.name})
end

local unit_settings = 
{
    "small",
    "medium",
    "big",
    "behemoth"
}

local biter_pack_order = 10
for _,unit_setting in pairs(unit_settings)
do
    local biter_pack_projectile = table.deepcopy(data.raw["projectile"]["se-capsule-"..unit_setting.."-biter"])
    local biter_pack_capsule = table.deepcopy(data.raw["capsule"]["se-capsule-"..unit_setting.."-biter"])

    biter_pack_capsule.name = data_util.mod_prefix .. unit_setting.. "-biter-pack"
    biter_pack_capsule.capsule_action.attack_parameters.ammo_type.action.action_delivery.projectile = data_util.mod_prefix .. unit_setting.. "-biter-pack"
    biter_pack_capsule.localised_name = nil
    biter_pack_capsule.order = "u[unit-capsule]-" .. biter_pack_order
    biter_pack_order = biter_pack_order + 1
    biter_pack_capsule.icons = 
    {
        {icon="__space-exploration-graphics__/graphics/icons/vatling.png", icon_size=64, shift={-8,0}},
        {icon="__base__/graphics/icons/"..unit_setting.."-biter.png", icon_size=64, scale=.33, shift={3,-5}},
        {icon="__base__/graphics/icons/"..unit_setting.."-spitter.png", icon_size=64, scale=.33, shift={3,7}}
    }

    biter_pack_projectile.name = data_util.mod_prefix .. unit_setting.. "-biter-pack"
    biter_pack_projectile.action.action_delivery.target_effects = 
    {
        {
            entity_name = unit_setting.. "-biter",
            show_in_tooltip = true,
            trigger_created_entity = true,
            repeat_count = 3,
            type = "create-entity"
        },
        {
            entity_name = unit_setting.. "-spitter",
            show_in_tooltip = true,
            trigger_created_entity = true,
            repeat_count = 2,
            type = "create-entity"
        },
    }

    data:extend({biter_pack_capsule, biter_pack_projectile})

    add_weapon_delivery_cannon_ammo(data.raw["capsule"][data_util.mod_prefix..unit_setting.."-biter-pack"], "se-capsule-"..unit_setting.."-biter")
    data.raw["recipe"][wdc_prefix..biter_pack_capsule.name].ingredients = 
    {
        {name="se-capsule-"..unit_setting.."-biter", amount=3},
        {name="se-capsule-"..unit_setting.."-spitter", amount=2},
        {name="se-delivery-cannon-weapon-capsule", amount=1}
    }
    data.raw["recipe"][wdc_prefix..biter_pack_capsule.name].order = "d-b|-b-|-d[capsule]-c[biter-pack-"..unit_setting.."]"
    data.raw["recipe"][wdc_prefix..biter_pack_capsule.name].icons = biter_pack_capsule.icons
end


local bloatburst_rocket_ammo = table.deepcopy(data.raw["ammo"]["atomic-bomb"])
local bloatburst_stream = data.raw["stream"]["se-bloater-stream"]
local bloatburst_rocket_projectile = table.deepcopy(data.raw["projectile"]["explosive-rocket"])
local bloatburst_ammo = data.raw["ammo"]["se-bloater-ammo"]

bloatburst_rocket_ammo.name = data_util.mod_prefix .. "bloatburst-rocket"
bloatburst_rocket_ammo.ammo_type.action.action_delivery.projectile = data_util.mod_prefix .. "bloatburst-rocket"
bloatburst_rocket_ammo.icon = bloatburst_ammo.icon
bloatburst_rocket_ammo.icon_size = bloatburst_ammo.icon_size

bloatburst_rocket_projectile.name = data_util.mod_prefix .. "bloatburst-rocket"
bloatburst_rocket_projectile.action.action_delivery.target_effects = bloatburst_stream.initial_action[1].action_delivery.target_effects

data:extend({bloatburst_rocket_ammo, bloatburst_rocket_projectile})
add_weapon_delivery_cannon_ammo(data.raw["ammo"][data_util.mod_prefix .. "bloatburst-rocket"], "se-biogun")
data.raw["recipe"][wdc_prefix..bloatburst_rocket_ammo.name].ingredients = 
{
    {name="se-bloater-ammo", amount=1},
    {name="explosives", amount=2},
    {name="se-delivery-cannon-weapon-capsule", amount=1}
}


local antimatter_bomb_ammo = table.deepcopy(data.raw["ammo"]["atomic-bomb"])
local antimatter_canister_item = data.raw["item"]["se-antimatter-canister"]

antimatter_bomb_ammo.name = data_util.mod_prefix .. "antimatter-bomb"
antimatter_bomb_ammo.icon = antimatter_canister_item.icon
antimatter_bomb_ammo.icon_size = antimatter_canister_item.icon_size
data:extend({antimatter_bomb_ammo})
add_weapon_delivery_cannon_ammo(data.raw["ammo"][data_util.mod_prefix .. "antimatter-bomb"], "se-antimatter-production")
data.raw["recipe"][wdc_prefix..antimatter_bomb_ammo.name].ingredients = 
{
    {name="se-antimatter-canister", amount=2},
    {name="rocket-control-unit", amount=2},
    {name="explosives", amount=10},
    {name="se-delivery-cannon-weapon-capsule", amount=1}
}
data.raw["recipe"][wdc_prefix..antimatter_bomb_ammo.name].energy_required = 50


add_weapon_delivery_cannon_ammo(data.raw["capsule"]["destroyer-capsule"], "destroyer")
