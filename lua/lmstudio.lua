local adapters = require("codecompanion.adapters")

-- Вынесем создание адаптера в переменную
local my_adapter = function()
    return adapters.extend("openai", {
        env = {
            url = "http://127.0.0.1:1234",
            api_key = "none"
        },
        url = "http://127.0.0.1:1234/v1/chat/completions",
        schema = {
            model = {
                default = "deepseek-coder-v2-lite-instruct"
            }
        }
    })
end

require("codecompanion").setup({
    adapters = {
        my_lmstudio = my_adapter,
    },
    strategies = {
        -- Передаем функцию напрямую вместо строки
        chat = { adapter = my_adapter },
        inline = { adapter = my_adapter },
        agent = { adapter = my_adapter },
    },
})

