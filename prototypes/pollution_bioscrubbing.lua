local data_util = require("data_util")

local used_bioscrubber_item = table.deepcopy(data.raw["item"]["se-bioscrubber"])
used_bioscrubber_item.name = data_util.mod_prefix .. "used-bioscrubber"

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
    crafting_machine_tint = {primary={1,1,1}, secondary={1,1,1}, tertiary={1,1,1}}
}

local bioscrubber_cleaning_recipe = 
{
    name = data_util.mod_prefix .. "bioscrubber-cleaning",
    type = "recipe",
    category="chemistry",
    ingredients = 
    {
        {type="item", name=used_bioscrubber_item.name, amount=1},
        {type="fluid", name="steam", amount=100}
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
    crafting_machine_tint = {primary={1,1,1}, secondary={1,1,1}, tertiary={1,1,1}}
}

data:extend(
{
    used_bioscrubber_item,
    pollution_scrubbing_recipe,
    bioscrubber_cleaning_recipe,
})