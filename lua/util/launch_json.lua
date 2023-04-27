local M = {}

M.load = function()
  local vscode = require("dap.ext.vscode")
  local dap = require("dap")
  for _, lang_config in pairs(dap.configurations) do
    local j = 1
    while j <= #lang_config do
      if lang_config[j]["dynamic"] == true then
        table.remove(lang_config, j)
      else
        j = j + 1
      end
    end
  end
  local original_config = vim.deepcopy(dap.configurations)

  local file = vim.fn.findfile(".vscode/launch.json", ".;")
  if vim.fn.filereadable(file) then
    vscode.load_launchjs(
      file,
      { delve = { "go" }, ["pwa-node"] = { "typescript", "typescriptreact", "javascript", "javascriptreact" } }
    )
  end

  local root = require("lazyvim.util").get_root()
  for lang, lang_configs in pairs(dap.configurations) do
    for _, config in pairs(lang_configs) do
      if original_config[lang] == nil or not vim.tbl_contains(original_config[lang], config) then
        config.dynamic = true
        for i, v in pairs(config) do
          if type(v) == "string" then
            config[i] = v:gsub("${workspaceFolder}", root)
          end
        end
      end
    end
  end
end

return M
