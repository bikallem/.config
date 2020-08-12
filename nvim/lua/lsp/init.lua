local lsp_status = require('lsp-status')
local diagnostic = require('diagnostic')
local completion = require('completion')
local nvim_lsp = require('nvim_lsp')

local on_attach = function(client, bufnr)
  lsp_status.on_attach(client, bufnr)
  diagnostic.on_attach(client, bufnr)
  completion.on_attach(client, bufnr)
end


lsp_status.register_progress()
lsp_status.config({
  status_symbol = '',
  indicator_ok = '✓'
})

nvim_lsp.clangd.setup({
  callbacks = lsp_status.extensions.clangd.setup(),
  init_options = {
    clangdFileStatus = true
  },
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
})
nvim_lsp.pyls.setup{
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
}
nvim_lsp.sumneko_lua.setup{
  on_attach = on_attach,
}
nvim_lsp.vimls.setup{
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
}
-- nvim_lsp.tsserver.setup{
--   on_attach = on_attach,
--   capabilities = lsp_status.capabilities
-- }
require'nvim_lsp'.flow.setup{
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
}

local configs = require 'nvim_lsp/configs'
-- local util = require 'nvim_lsp/util'



-- if not nvim_lsp.sorbet then
configs.sorbet = {
  default_config = {
    cmd = {"pay", "exec", "scripts/bin/typecheck", "--lsp"};
    filetypes = {"ruby"};
    root_dir = nvim_lsp.util.root_pattern("Gemfile", ".git");
  };
};
-- end
nvim_lsp.sorbet.setup{
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
}
