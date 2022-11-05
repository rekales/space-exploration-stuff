local data_util = require("data_util")

local function on_chunk_generated(event)
    local surface = event.surface
    if surface.map_gen_settings.autoplace_controls
    and surface.map_gen_settings.autoplace_controls["enemy-base"]
    and surface.map_gen_settings.autoplace_controls["enemy-base"].size == -1
    then
        surface.create_entity{name=data_util.mod_prefix .. "pollution-absorber", position={x=event.position.x*32, y=event.position.y*32}}
    end
end

local function on_gui_click(event)
    if string.sub(event.element.name, 1, 5) == "zone_" and event.element.row_flow
    then
        local surface_name = event.element.row_flow.cell_name.caption
        if surface_name == "Nauvis"
        then
            surface_name = "nauvis"
        end

        local surface = game.get_surface(surface_name)
        if surface
        and surface.map_gen_settings.autoplace_controls
        and surface.map_gen_settings.autoplace_controls["enemy-base"]
        and surface.map_gen_settings.autoplace_controls["enemy-base"].size == -1
        then
            local chunk = surface.get_random_chunk()
            if not surface.find_entity(data_util.mod_prefix .. "pollution-absorber", {chunk.x*32+.5, chunk.y*32+.5})
            and not (chunk.x == 0 and chunk.y == 0 and not surface.is_chunk_generated({0,0}))
            and surface.is_chunk_generated(chunk)
            then
                for chunk in surface.get_chunks()
                do
                    surface.create_entity{name=data_util.mod_prefix .. "pollution-absorber", position={x=chunk.x*32, y=chunk.y*32}}
                end
            end
        end
    end
end

if settings.startup["cancel-pollution-emission"].value 
then
    Event.add_config_changed_listener(function()
        for _,surface in pairs(game.surfaces)
        do
            if surface.map_gen_settings.autoplace_controls
            and surface.map_gen_settings.autoplace_controls["enemy-base"]
            and surface.map_gen_settings.autoplace_controls["enemy-base"].size == -1
            then
                local chunk = surface.get_random_chunk()
                if not surface.find_entity(data_util.mod_prefix .. "pollution-absorber", {chunk.x*32+.5, chunk.y*32+.5})
                and not (chunk.x == 0 and chunk.y == 0 and not surface.is_chunk_generated({0,0}))
                and surface.is_chunk_generated(chunk)
                then
                    for chunk in surface.get_chunks()
                    do
                        surface.create_entity{name=data_util.mod_prefix .. "pollution-absorber", position={x=chunk.x*32, y=chunk.y*32}}
                    end
                end
            end
        end
    end)
    
    Event.add_listener(defines.events.on_chunk_generated, on_chunk_generated)
    Event.add_listener(defines.events.on_gui_click, on_gui_click)
end