local data_util = require("data_util")

data:extend(
{
    {
        name = "se-delivery-cannon-weapon-package-" .. "se-delivery-cannon-capsule",
        type = "item",
        subgroup = "intersurface-part",
        stack_size = 1,
        icons = 
        {
            {
                icon="__space-exploration-graphics__/graphics/icons/delivery-cannon-capsule.png", 
                icon_size = 64
            },
            {
                icon=data.raw["item"]["steel-plate"].icon, 
                icon_size=data.raw["item"]["steel-plate"].icon_size, 
                scale = 0.25,
                shift = {7,7}
            }
        },
        
    },
    {
        name = "se-delivery-cannon-weapon-pack-" .. "se-delivery-cannon-capsule",
        type = "recipe",
        category = "delivery-cannon",
        ingredients = {{name="se-delivery-cannon-capsule", amount=1},{name="se-heat-shielding", amount=2}, {name="steel-plate", amount=2}},
        result = "se-delivery-cannon-weapon-package-" .. "se-delivery-cannon-capsule",
        result_count = 1,
        energy_required = 10,
        enabled = false,
        icons = 
        {
            {
                icon="__space-exploration-graphics__/graphics/icons/delivery-cannon-capsule.png", 
                icon_size = 64
            },
            {
                icon=data.raw["item"]["steel-plate"].icon, 
                icon_size=data.raw["item"]["steel-plate"].icon_size, 
                scale = 0.25,
                shift = {7,7}
            }
        },
    },
})

table.insert(data.raw["technology"]["se-delivery-cannon"].effects, {type="unlock-recipe", recipe="se-delivery-cannon-weapon-pack-" .. "se-delivery-cannon-capsule"})
