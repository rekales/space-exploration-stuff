local data_util = {}

data_util.mod_prefix = "ses-"

---creates "icons" from the prototype's icon
---returns the icons of the prototype if it already exists
---returns null if both icons and icon doesn't exist
---@param prototype any
---@return icons | nil
function data_util.make_icons(prototype)
    if prototype.icons
    then
        return prototype.icons

    elseif prototype.icon
    then
        return {{icon=prototype.icon, icon_size=prototype.icon_size}}
    else
        return nil
    end
end

---comment
---@param prototype_from prototype
---@param prototype_to prototype
---@return table prototype.icons
function data_util.make_transition_icon(prototype_from, prototype_to)

    local icons = {{icon="__space-exploration-graphics__/graphics/blank.png", scale=0.5, shift={0,0}, icon_size = 64}}
    
    if prototype_from.icons
    then
        for _,icon_elem in pairs(prototype_from.icons)
        do
            table.insert(icons, {icon=icon_elem.icon, scale=0.33*64/icon_elem.icon_size, shift={8,-8}, icon_size=icon_elem.icon_size, tint=icon_elem.tint})
        end
    else
        table.insert(icons, {icon=prototype_from.icon, scale=0.33*64/prototype_from.icon_size, shift={8,-8}, icon_size=prototype_from.icon_size, tint=prototype_from.tint})
    end

    if prototype_to.icons
    then
        for _,icon_elem in pairs(prototype_to.icons)
        do
            table.insert(icons, {icon=icon_elem.icon, scale=0.33*64/icon_elem.icon_size, shift={-8,8}, icon_size=icon_elem.icon_size, tint=icon_elem.tint})
        end
    else
        table.insert(icons, {icon=prototype_to.icon, scale=0.33*64/prototype_to.icon_size, shift={-8,8}, icon_size=prototype_to.icon_size, tint=prototype_to.tint})
    end

    table.insert(icons, {icon="__space-exploration-graphics__/graphics/icons/transition-arrow.png", scale=0.5, shift={0,0}, icon_size=64})

    return icons
end

return data_util