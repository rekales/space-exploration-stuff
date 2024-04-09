local data_util = require("data_util")

if settings.startup[data_util.mod_prefix.."matter-fusion-viability"].value 
then 
  ---@param recipe_prototype prototype type="recipe"
  ---@param result_name string
  ---@param new_amount number 
  ---@return boolean
  local function edit_recipe_result_value(recipe_prototype, result_name, new_amount)
    if recipe_prototype.results
    then
      for _,result in pairs(recipe_prototype.results)
      do
        if result.name == result_name
        then
          result.amount = new_amount
          result.probability = 1
          return true
        end
      end
    else
      for _,result in pairs(recipe_prototype.normal.results)
      do
        if result.name == result_name
        then
          result.amount = new_amount
          result.probability = 1
          return true
        end
      end
    end  
    return false
  end

  edit_recipe_result_value(data.raw["recipe"]["se-matter-fusion-vulcanite"], "se-vulcanite", 6)
  edit_recipe_result_value(data.raw["recipe"]["se-matter-fusion-cryonite"], "se-cryonite", 5)
  edit_recipe_result_value(data.raw["recipe"]["se-matter-fusion-beryllium"], "se-beryllium-ore", 4)
  edit_recipe_result_value(data.raw["recipe"]["se-matter-fusion-holmium"], "se-holmium-ore", 3)
  edit_recipe_result_value(data.raw["recipe"]["se-matter-fusion-iridium"], "se-iridium-ore", 3)
  edit_recipe_result_value(data.raw["recipe"]["se-matter-fusion-uranium"], "uranium-ore", 2)
end