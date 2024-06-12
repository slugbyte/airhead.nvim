local M = {}

-- limit keys, aka dont allow willy nilly tweaks to theme.ui
local tweak_background_keys = {
    "normal",
    "menu",
    "popup",
    "telescope",
}

-- modify the theme based on setup's config.tweak_background
M.background = function(tweak_background, theme)
    for _, key in ipairs(tweak_background_keys) do
        local value = tweak_background[key]
        if value and (value ~= 'default') then
            theme.ui["bg_" .. key] = value
        end
    end
end


-- limit keys, aka dont allow willy nilly tweaks to theme.syntax
local tweak_syntax_keys = {
    "string",
    "string_escape",
    "comment",
    "builtin",
    "type",
    "keyword",
    "keyword_return",
    "keyword_exception",
}

-- modify the theme based on setup's config.tweak_syntax
M.syntax = function(tweak_syntax, theme)
    for _, key in ipairs(tweak_syntax_keys) do
        local value = tweak_syntax[key]
        if value and (value ~= 'default') then
            theme.syntax_tweak[key] = value
            if key == 'type' then
                -- M.color.syntax_tweak.type_def = value
                theme.syntax_tweak.type_primitive = value
            end
        end
    end
end

return M
