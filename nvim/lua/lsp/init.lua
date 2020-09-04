local diagnostic = require('diagnostic')
local nvim_lsp = require('nvim_lsp')
local configs = require('nvim_lsp/configs')
local util = require('nvim_lsp/util')

local on_attach = function(client, bufnr)
  diagnostic.on_attach(client, bufnr)

  -- Keybindings for LSPs
  vim.fn.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "1gD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", {noremap = true, silent = true})
end

nvim_lsp.clangd.setup({
  on_attach = on_attach,
})
nvim_lsp.pyls.setup{
  on_attach = on_attach,
}
nvim_lsp.sumneko_lua.setup{
  on_attach = on_attach,
}
nvim_lsp.vimls.setup{
  on_attach = on_attach,
}
-- nvim_lsp.tsserver.setup{
--   on_attach = on_attach,
--   capabilities = lsp_status.capabilities
-- }
nvim_lsp.flow.setup{
  -- cmd = {"$HOME/stripe/pay-server/manage/frontend/node_modules/.bin/flow"},
  on_attach = on_attach,
  -- util.root_pattern(".flowconfig"),
  -- root_dir = util.find_node_modules_ancestor(vim.fn.expand('%'))
}
-- print(util.root_pattern(".flowconfig"))


-- local util = require 'nvim_lsp/util'



configs.sorbet = {
  default_config = {
    cmd = {"pay", "exec", "/pay/src/pay-server/scripts/bin/typecheck", "--lsp"};
    filetypes = {"ruby"};
    root_dir = nvim_lsp.util.root_pattern("Gemfile", ".git");
  };
};
nvim_lsp.sorbet.setup{
  on_attach = on_attach,
}

nvim_lsp.html.setup{
  on_attach = on_attach,
}
nvim_lsp.cssls.setup{
  on_attach = on_attach,
  settings = {
    css = {
      validate = false
    },
    less = {
      validate = true
    },
    scss = {
      validate = true
    }
  }
}

local server_name = "svelte_lsp"
local bin_name = "svelteserver"

-- local installer = util.npm_installer {
--   server_name = server_name,
--   packages = {"svelte-language-server"},
--   binaries = {bin_name}
-- }

configs[server_name] = {
  default_config = {
    cmd = {bin_name, "--stdio"};
    filetypes = {"svelte"};
    root_dir = util.root_pattern("package.json", "tsconfig.json", ".git");
   -- docs = {
   --   description = [[
   --   https://github.com/theia-ide/typescript-language-server
   --   `typescript-language-server` can be installed via `:LspInstall tsserver` or by yourself with `npm`:
   --   ```sh
   --   npm install -g typescript-language-server
   --   ```
   --   ]];
   --   default_config = {
   --     root_dir = [[root_pattern("package.json", "tsconfig.json", ".git")]];
   --   };
   -- };
 };
}
nvim_lsp.svelte_lsp.setup{
  on_attach = on_attach,
}
nvim_lsp.rust_analyzer.setup{
  on_attach = on_attach,
}
nvim_lsp.elixirls.setup{
  on_attach = on_attach,
}
nvim_lsp.gopls.setup{
  on_attach = on_attach,
}
