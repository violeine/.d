function setup()
  local nvim_ts  = require 'nvim-treesitter.configs'
  local lsp = require 'lspconfig'
  local lsp_status = require('lsp-status')
  lsp_status.register_progress()

  lsp_status.config({
      current_function = false,
      status_symbol = 'LSP ',
      indicator_errors = 'E',
      indicator_warnings = 'W',
      indicator_info = 'i',
      indicator_hint = '?',
      indicator_ok = 'Ok',
    })

  local map = function(mode, key, result, noremap)
    if noremap == nil then
      noremap = true
    end
    vim.api.nvim_buf_set_keymap(0, mode, key, result, {noremap = noremap, silent = true})
  end

  --no-virtual_text
  vim.lsp.handlers["textDocument/publishDiagnostics"] = function(...)
    vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics,
      {
        underline = true,
        update_in_insert = false,
        virtual_text = false
      }
      )(...)
  end

  -- async formatting
  vim.lsp.handlers["textDocument/formatting"] = function(err, _, result, _, bufnr)
    if err ~= nil or result == nil then
      return
    end
    if not vim.api.nvim_buf_get_option(bufnr, "modified") then
      local view = vim.fn.winsaveview()
      vim.lsp.util.apply_text_edits(result, bufnr)
      vim.fn.winrestview(view)
      if bufnr == vim.api.nvim_get_current_buf() then
        vim.cmd [[noautocmd :update]]
        vim.cmd [[GitGutter]]
      end
    end
  end
  -- https://github.com/lukas-reineke/dotfiles/blob/e67a005cdb50965795bcac45c1f312748219fcc4/vim/lua/lsp.lua#L73-L100
  local format_options_prettier = {
    tabWidth = 2,
    singleQuote = false,
    trailingComma = "all",
    configPrecedence = "prefer-file"
  }
  vim.g.format_options_typescript = format_options_prettier
  vim.g.format_options_javascript = format_options_prettier
  vim.g.format_options_typescriptreact = format_options_prettier
  vim.g.format_options_javascriptreact = format_options_prettier
  vim.g.format_options_json = format_options_prettier
  vim.g.format_options_css = format_options_prettier
  vim.g.format_options_scss = format_options_prettier
  vim.g.format_options_html = format_options_prettier
  vim.g.format_options_yaml = format_options_prettier
  vim.g.format_options_markdown = format_options_prettier

  FormatToggle = function(value)
    vim.g[string.format("format_disabled_%s", vim.bo.filetype)] = value
  end
  vim.cmd [[command! FormatDisable lua FormatToggle(true)]]
  vim.cmd [[command! FormatEndable lua FormatToggle(false)]]

  _G.formatting = function()
    if not vim.g[string.format("format_disabled_%s", vim.bo.filetype)] then
      vim.lsp.buf.formatting(vim.g[string.format("format_options_%s", vim.bo.filetype)] or {})
    end
  end

  FormatToggle = function(value)
    vim.g[string.format("format_disabled_%s", vim.bo.filetype)] = value
  end
  vim.cmd [[command! FormatDisable lua FormatToggle(true)]]
  vim.cmd [[command! FormatEndable lua FormatToggle(false)]]

  _G.formatting = function()
    if not vim.g[string.format("format_disabled_%s", vim.bo.filetype)] then
      vim.lsp.buf.formatting(vim.g[string.format("format_options_%s", vim.bo.filetype)] or {})
    end
  end

  function my_attach(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd [[augroup Format]]
      vim.cmd [[autocmd! * <buffer>]]
      vim.cmd [[autocmd BufWritePost <buffer> lua formatting()]]
      vim.cmd [[augroup END]]
    end
    if client.resolved_capabilities.goto_definition then
      map("n", "<C-]>", "<cmd>lua vim.lsp.buf.definition()<CR>")
    end
    if client.resolved_capabilities.hover then
      map("n", "<CR>", "<cmd>lua vim.lsp.buf.hover()<CR>")
    end
    if client.resolved_capabilities.find_references then
      map("n", "<Leader>*", ":call lists#ChangeActiveList('Quickfix')<CR>:lua vim.lsp.buf.references()<CR>")
    end
    if client.resolved_capabilities.rename then
      map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
    end
    lsp_status.on_attach(client)
  end
  -- efm langserver
  local prettier = require "efm/prettier"
  lsp.efm.setup {
    on_attach = my_attach,
    init_options = {documentFormatting = true},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            typescript = {prettier},
            javascript = {prettier},
            typescriptreact = {prettier, eslint},
            javascriptreact = {prettier, eslint},
            yaml = {prettier},
            json = {prettier},
            html = {prettier},
            scss = {prettier},
            css = {prettier},
            markdown = {prettier},
        }
    }
}
  --typescript langserver
  lsp.tsserver.setup {
    on_attach = function(client)
      client.resolved_capabilities.document_formatting = false
      my_attach(client)
    end,
      capabilities = lsp_status.capabilities,
    root_dir = lsp.util.root_pattern("package.json", "tsconfig.json", ".git")
  };
lsp.cssls.setup {
    on_attach = function(client)
      client.resolved_capabilities.document_formatting = false
      my_attach(client)
    end,
};
  --- treesitter
  nvim_ts.setup {
    ensure_installed = "maintained",

    highlight = {
      enable = true,
      disable = { "clojure"}
    },
  }
end

return {
  setup=setup
}
