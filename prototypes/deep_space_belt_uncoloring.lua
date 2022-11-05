if settings.startup["belt-uncoloring"].value 
then 
    local data_util = require("data_util")

    local belt_colors = 
    {   
        "blue",
        "cyan",
        "green",
        "magenta",
        "red",
        "white",
        "yellow",
    }

    for _,color in pairs(belt_colors)
    do
        local belt_recipe = table.deepcopy(data.raw["recipe"]["se-deep-space-transport-belt-blue"])
        local underbelt_recipe = table.deepcopy(data.raw["recipe"]["se-deep-space-underground-belt-blue"])
        local splitter_recipe = table.deepcopy(data.raw["recipe"]["se-deep-space-splitter-blue"])

        belt_recipe.name = data_util.mod_prefix .. "transport-belt-" .. color .. "-to-black"
        belt_recipe.category = "hard-recycling"
        belt_recipe.order = "z-c-a-" .. color
        belt_recipe.ingredients = {{name="se-deep-space-transport-belt-"..color, amount=1}}
        belt_recipe.results = {{name="se-deep-space-transport-belt-black", amount=1}}
        belt_recipe.icons = data_util.make_transition_icon(data.raw["item"]["se-deep-space-transport-belt-"..color], data.raw["item"]["se-deep-space-transport-belt-black"])
        table.insert(data.raw["technology"]["se-deep-space-transport-belt"].effects, {type="unlock-recipe", recipe=belt_recipe.name})

        underbelt_recipe.name = data_util.mod_prefix .. "underground-belt-" .. color .. "-to-black"
        underbelt_recipe.category = "hard-recycling"
        underbelt_recipe.order = "z-d-a-" .. color
        underbelt_recipe.ingredients = {{name="se-deep-space-underground-belt-"..color, amount=1}}
        underbelt_recipe.results = {{name="se-deep-space-underground-belt-black", amount=1}}
        underbelt_recipe.icons = data_util.make_transition_icon(data.raw["item"]["se-deep-space-underground-belt-"..color], data.raw["item"]["se-deep-space-underground-belt-black"])
        table.insert(data.raw["technology"]["se-deep-space-transport-belt"].effects, {type="unlock-recipe", recipe=underbelt_recipe.name})

        splitter_recipe.name = data_util.mod_prefix .. "splitter-" .. color .. "-to-black"
        splitter_recipe.category = "hard-recycling"
        splitter_recipe.order = "z-e-a-" .. color
        splitter_recipe.ingredients = {{name="se-deep-space-splitter-"..color, amount=1}}
        splitter_recipe.results = {{name="se-deep-space-splitter-black", amount=1}}
        splitter_recipe.icons = data_util.make_transition_icon(data.raw["item"]["se-deep-space-splitter-"..color], data.raw["item"]["se-deep-space-splitter-black"])
        table.insert(data.raw["technology"]["se-deep-space-transport-belt"].effects, {type="unlock-recipe", recipe=splitter_recipe.name})

        data:extend(
            {
                belt_recipe,
                underbelt_recipe,
                splitter_recipe,
            }
        )
    end
end
