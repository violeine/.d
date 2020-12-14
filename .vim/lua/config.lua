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
  nvim_ts.setup {
    ensure_installed = "maintained",

    highlight = {
      enable = true,
      disable = { "clojure"}
    },
  }
  lsp.tsserver.setup {
    handlers = {
       ["textDocument/publishDiagnostics"] = vim.lsp.with(
         vim.lsp.diagnostic.on_publish_diagnostics, {
           -- Disable virtual_text
           virtual_text = false,
         }),
       },
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities
  };

end

return {
    setup=setup
}

