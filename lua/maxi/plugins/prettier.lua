local status, prettier = pcall(require, "prettier")
if not status then
  print "hey!"
  return
end

prettier.setup({
  bin = 'prettierd',
  filetypes = {
    "astro",
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
  cli_options = {
    arrow_parens = "always",
    bracket_spacing = true,
    bracket_same_line = false,
    embedded_language_formatting = "auto",
    end_of_line = "lf",
    html_whitespace_sensitivity = "css",
    -- jsx_bracket_same_line = false,
    jsx_single_quote = false,
    print_width = 100,
    prose_wrap = "preserve",
    quote_props = "as-needed",
    semi = true,
    single_attribute_per_line = false,
    single_quote = false,
    tab_width = 2,
    trailing_comma = "es5",
    use_tabs = false,
    vue_indent_script_and_style = false,
    config_precedence = "prefer-file",
  },
  ["null-ls"] = {
    condition = function()
      return prettier.config_exists({
        check_package_json = true,
      })
    end,
    runtime_condition = function()
      return true
    end,
    timeout = 5000,
  },
})
