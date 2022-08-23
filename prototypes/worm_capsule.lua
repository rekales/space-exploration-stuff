local data_util = require("data_util")
local mod_prefix = data_util.mod_prefix
require ("__base__.prototypes.entity.biter-animations")

local unit_settings = 
{
  {
    name="small-worm-turret",
    stack_size = 100,
    cooldown = 10,
    craft_time = 10,
    prerequisites = {"se-vitalic-acid"},
    ingredients = 
    {
      { name = "se-specimen", amount = 1 },
      { type = "fluid", name = "se-vitalic-acid", amount = 20 },
      { type = "fluid", name = "se-nutrient-gel", amount = 20 },
    },
    tech_unit = { count = 100, time = 60, ingredients = { { "se-biological-science-pack-1", 1 }, } }
  },
  {
    name="medium-worm-turret",
    stack_size = 75,
    cooldown = 15,
    craft_time = 20,
    prerequisites = {mod_prefix.."capsule-small-worm-turret", "se-vitalic-reagent"},
    ingredients = {
      { name = mod_prefix .. "capsule-small-worm-turret", amount = 1 },
      { name = "se-vitalic-reagent", amount = 4 },
      { type = "fluid", name = "se-nutrient-gel", amount = 40 },
    },
    tech_unit = { count = 200, time = 60, ingredients = { { "se-biological-science-pack-2", 1 }, } }
  },
  {
    name="big-worm-turret",
    stack_size = 50,
    cooldown = 20,
    craft_time = 30,
    prerequisites = {mod_prefix.."capsule-medium-worm-turret", "se-vitalic-epoxy"},
    ingredients = {
      { name = mod_prefix .. "capsule-medium-worm-turret", amount = 1 },
      { name = "se-vitalic-epoxy", amount = 4 },
      { type = "fluid", name = "se-nutrient-gel", amount = 60 },
    },
    tech_unit = { count = 300, time = 60, ingredients = { { "se-biological-science-pack-3", 1 }, } }
  },
  {
    name="behemoth-worm-turret",
    stack_size = 25,
    cooldown = 25,
    craft_time = 40,
    prerequisites = {mod_prefix.."capsule-big-worm-turret", "se-self-sealing-gel"},
    ingredients = {
      { name = mod_prefix .. "capsule-big-worm-turret", amount = 1 },
      { name = "se-self-sealing-gel", amount = 4 },
      { type = "fluid", name = "se-nutrient-gel", amount = 80 },
    },
    tech_unit = { count = 400, time = 60, ingredients = { { "se-biological-science-pack-4", 1 }, } }
  },
}

for i, unit_setting in pairs(unit_settings) do
  local name = mod_prefix .. "capsule-"..unit_setting.name
  local base_entity = data.raw.turret[unit_setting.name]
  data:extend({
    {
      type = "capsule",
      subgroup = "capsule",
      name = name,
      capsule_action = {
        attack_parameters = {
          ammo_category = "capsule",
          ammo_type = {
            action = {
              action_delivery = {
                projectile = name,
                starting_speed = 0.3,
                type = "projectile"
              },
              type = "direct"
            },
            category = "capsule",
            target_type = "position"
          },
          cooldown = unit_setting.cooldown,
          projectile_creation_distance = 0.6,
          range = 25,
          type = "projectile"
        },
        type = "throw"
      },
      icons = {
        {icon = "__space-exploration-graphics__/graphics/icons/vatling.png", icon_size = 64, shift = {-8, 0}},
        {icon = base_entity.icon, icon_size = base_entity.icon_size, shift = {2, 0}}
      },
      order = "u[unit-capsule]-"..string.format("%02d", i+8),
      stack_size = unit_setting.stack_size,
      localised_name = {"space-exploration.unit-capsule", {"entity-name."..unit_setting.name}}
    },
    {
      type = "projectile",
      name = name,
      acceleration = 0.005,
      action = {
        action_delivery = {
          target_effects = {
            entity_name = unit_setting.name,
            show_in_tooltip = true,
            trigger_created_entity = true,
            type = "create-entity"
          },
          type = "instant"
        },
        type = "direct"
      },
      animation = {
        filename = "__base__/graphics/entity/poison-capsule/poison-capsule.png",
        frame_count = 1,
        height = 32,
        priority = "high",
        width = 32
      },
      flags = {
        "not-on-map"
      },
      light = {
        intensity = 0.5,
        size = 4
      },
      shadow = {
        filename = "__base__/graphics/entity/poison-capsule/poison-capsule-shadow.png",
        frame_count = 1,
        height = 32,
        priority = "high",
        width = 32
      },
      smoke = nil,
    },
  })
  if unit_setting.ingredients then
    data:extend({
      {
        type = "recipe",
        name = name,
        result = name,
        enabled = false,
        energy_required = unit_setting.craft_time,
        ingredients = unit_setting.ingredients,
        requester_paste_multiplier = 1,
        always_show_made_in = true,
        category = "space-growth"
      }
    })
  end
  if unit_setting.tech_unit then
    data:extend({
      {
        type = "technology",
        name = name,
        effects = {
         {
           type = "unlock-recipe",
           recipe = name,
         },
        },
        icons = {
          {icon = "__space-exploration-graphics__/graphics/technology/vatling.png", icon_size = 128},
          {icon = base_entity.icon, icon_size = base_entity.icon_size, shift = {0, 8}}
        },
        order = "e-g",
        prerequisites = unit_setting.prerequisites,
        unit = unit_setting.tech_unit,
        localised_name = {"space-exploration.unit-capsule", {"entity-name."..unit_setting.name}},
        localised_description = {"technology-description.se-unit-capsule", {"entity-name."..unit_setting.name}}
      },
    })
  end
end
