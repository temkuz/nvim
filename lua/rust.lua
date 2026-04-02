local capabilities = require('cmp_nvim_lsp').default_capabilities()

local rust_analyzer_config = {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        if vim.lsp.inlay_hint then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end
    end,
    settings = {
        ['rust-analyzer'] = {
            -- workspace = {symbol={search={kind='all_symbols'}}},
            check = {command='clippy'},
            completion = {
                postfix = { enable = false },
                autoimport = { enable = true },
            },
            procMacro = { enable = true }
        }
    }
}

vim.lsp.config("rust_analyzer", rust_analyzer_config)
vim.lsp.enable("rust_analyzer")

local cmp = require('cmp') 

cmp.setup({
    completion = {
        autocomplete = {
            cmp.TriggerEvent.TextChanged,
            cmp.TriggerEvent.InsertEnter,
        },
        keyword_length = 1,
    },
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },
    sources={
        {name='nvim_lsp', keyword_length = 1},
        {name='buffer', keyword_length = 1},
        {name='cmdline', keyword_length = 1},
        {name='nvim_lua', keyword_length = 1},
        {name='path', keyword_length = 1}
    },
    mapping = {
        ['<C-leader>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({select=false}),
        ['<Tab>'] = cmp.mapping(function (fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.snippet.active({ direction = 1 }) then
                vim.snippet.jump(1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.snippet.active({ direction = -1 }) then
                vim.snippet.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" })
    },
})

