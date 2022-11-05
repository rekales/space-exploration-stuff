if settings.startup["pollution-bioscrubbing"].value 
then 
    local data_util = require("data_util")

    local used_bioscrubber_item = table.deepcopy(data.raw["item"]["se-bioscrubber"])
    used_bioscrubber_item.name = data_util.mod_prefix .. "used-bioscrubber"
    used_bioscrubber_item.icon = "__space-exploration-stuff__/graphics/licensed/icons/used-bioscrubber.png"

    local pollution_scrubbing_recipe = 
    {
        name = data_util.mod_prefix .. "pollution-bioscrubbing",
        type = "recipe",
        category="chemistry",
        ingredients = 
        {
            {type="item", name="se-bioscrubber", amount=1},
            {type="item", name="coal", amount=2}
        },
        results = {{type="item", name=used_bioscrubber_item.name, amount=1}},
        energy_required = 240,
        emissions_multiplier = -20,
        allow_as_intermediate = false,
        crafting_machine_tint = {primary={0.7,0.7,0.7}, secondary={0.5,1,0.5}, tertiary={0.9,1,1}, quaternary={0.75,1,0.75}},
        icons = 
        {
            {
                icon = data.raw["item"]["se-bioscrubber"].icon,
                icon_size = data.raw["item"]["se-bioscrubber"].icon_size
            },
            {
                icon = data.raw["fluid"]["steam"].icon,
                icon_size = data.raw["fluid"]["steam"].icon_size,
                scale = .25,
                shift = {-7,-7},
                tint = {0.8, 0.8, 0.8}
            },
        },
    }
    pollution_scrubbing_recipe.localised_name = {"recipe-name."..pollution_scrubbing_recipe.name}

    local bioscrubber_cleaning_recipe = 
    {
        name = data_util.mod_prefix .. "bioscrubber-cleaning",
        type = "recipe",
        category="chemistry",
        ingredients = 
        {
            {type="item", name=used_bioscrubber_item.name, amount=1},
            {type="fluid", name="water", amount=100}
        },
        results = 
        {
            {type="item", name="se-bioscrubber", amount=1, probability=0.8},
            {type="item", name="sulfur", amount=1, probability=0.1},
            {type="item", name="coal", amount=1, probability=0.2},
            {type="item", name="sand", amount=1, probability=0.3},
        },
        energy_required = 10,
        allow_as_intermediate = false,
        main_product = "se-bioscrubber",
        crafting_machine_tint = {primary={0.6,0.4,0.2}, secondary={0.6,0.4,0.4}, tertiary={0.9,0.75,0.6,0.2}, quaternary={0.6,0.4,0.2,0.4}},
        icons = 
        {
            {
                icon = used_bioscrubber_item.icon,
                icon_size = used_bioscrubber_item.icon_size
            },
            {
                icon = data.raw["fluid"]["water"].icon,
                icon_size = data.raw["fluid"]["water"].icon_size,
                scale = .25,
                shift = {-7,-7}
            },
        },
    }
    bioscrubber_cleaning_recipe.localised_name = {"recipe-name."..bioscrubber_cleaning_recipe.name}

    data:extend(
    {
        used_bioscrubber_item,
        pollution_scrubbing_recipe,
        bioscrubber_cleaning_recipe,
    })
end