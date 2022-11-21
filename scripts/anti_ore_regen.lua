local data_util = require("data_util")

local function get_chunk_position(position)  --hey dipshit, don't forget about this
    return {x=math.floor(position.x/32), y=math.floor(position.y/32)}
end

local function get_chunk_bounding_box(chunk_position)
    return {left_top = {chunk_position.x*32, chunk_position.y*32}, right_bottom = {chunk_position.x*32 + 31, chunk_position.y*32 + 31}}
end

---@param surface_name string
---@param x integer
---@param y integer
---@return boolean last_value
local function add_depleted_chunk(surface_name, x, y)
    if not global.depleted_chunks[surface_name]
    then
        global.depleted_chunks[surface_name] = {}
    end
    if not global.depleted_chunks[surface_name][x]
    then
        global.depleted_chunks[surface_name][x] = {}
    end
    if not global.depleted_chunks[surface_name][x][y]
    then
        global.depleted_chunks[surface_name][x][y] = true
        return false
    end
    return true
end

local function is_depleted_chunk(surface_name, x, y)
    if not global.depleted_chunks[surface_name] then return false end
    if not global.depleted_chunks[surface_name][x] then return false end
    return global.depleted_chunks[surface_name][x][y]
end

local function check_neighbor_chunks(surface_name, position)
    local surface = game.get_surface(surface_name)

    position.x = position.x + 1
    if not is_depleted_chunk(surface_name, position.x, position.y) and surface.count_entities_filtered{type="resource", limit=1, area=get_chunk_bounding_box(position)} > 0
    then
        add_depleted_chunk(surface_name, position.x, position.y)
        check_neighbor_chunks(surface_name, position)
    end

    position.x = position.x - 2
    if not is_depleted_chunk(surface_name, position.x, position.y) and surface.count_entities_filtered{type="resource", limit=1, area=get_chunk_bounding_box(position)} > 0
    then
        add_depleted_chunk(surface_name, position.x, position.y)
        check_neighbor_chunks(surface_name, position)
    end
    position.x = position.x + 1

    position.y = position.y + 1
    if not is_depleted_chunk(surface_name, position.x, position.y) and surface.count_entities_filtered{type="resource", limit=1, area=get_chunk_bounding_box(position)} > 0
    then
        add_depleted_chunk(surface_name, position.x, position.y)
        check_neighbor_chunks(surface_name, position)
    end

    position.y = position.y - 2
    if not is_depleted_chunk(surface_name, position.x, position.y) and surface.count_entities_filtered{type="resource", limit=1, area=get_chunk_bounding_box(position)} > 0
    then
        add_depleted_chunk(surface_name, position.x, position.y)
        check_neighbor_chunks(surface_name, position)
    end
    position.y = position.y + 1
end

local function on_resource_depleted(event)
    local entity = event.entity
    local chunk = get_chunk_position(entity.position)
    local surface_name = entity.surface.name

    if not add_depleted_chunk(surface_name, chunk.x, chunk.y)
    then
        check_neighbor_chunks(surface_name, chunk)
    end
end

local function on_chunk_generated(event)
    local surface = event.surface
    if is_depleted_chunk(surface.name, event.position.x, event.position.y)
    then
        local resources = surface.find_entities_filtered{area=event.area, type="resource"}
        for _,resource in pairs(resources)
        do
            if resource.prototype.resource_category == "basic-solid"
            then
                resource.destroy{}
            end
        end
    end
end

if settings.startup[data_util.mod_prefix.."anti-ore-regen"].value 
then 
    Event.add_listener(defines.events.on_resource_depleted, on_resource_depleted)
    Event.add_listener(defines.events.on_chunk_generated, on_chunk_generated)
end