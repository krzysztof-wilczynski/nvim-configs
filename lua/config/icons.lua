-- Centralna baza ikon: rich (Nerd Font) vs minimal (ASCII)

local env = require("config.env")

local rich = {
  -- Lualine
  separators = { left = "", right = "" },
  component_separators = { left = "|", right = "|" },
  mode = "",
  branch = "",

  -- Dashboard (snacks)
  dashboard = {
    new_file = " ",
    find_file = " ",
    recent = " ",
    settings = " ",
    session = " ",
    lazy = "󰒲 ",
    quit = " ",
    browse = " ",
    git = " ",
    projects = " ",
  },

  -- Notifications (mini.notify)
  notify = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "󰙎",
    OFF = "",
  },

  -- TODO comments
  todo = {
    TODO = " ",
    FIXME = " ",
    NOTE = " ",
  },

  -- Markdown rendering
  markdown = {
    headings = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
    bullets = { "●", "○", "◆", "◇" },
    checkbox_unchecked = "󰄱 ",
    checkbox_checked = "󰄵 ",
    quote = "▎",
    hyperlink = "󰌷 ",
    image = "󰥶 ",
  },

  -- LSP status
  lsp = " ",
  venv = " ",

  -- Gitsigns (Unicode box drawing - dziala wszedzie)
  gitsigns = {
    add = "┃",
    change = "┃",
    delete = "_",
    topdelete = "‾",
    changedelete = "~",
  },

  -- Which-key
  whichkey = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },

  -- Completion (blink.cmp)
  nerd_font_variant = "mono",
  kind_icons = {
    Boolean = "[] Boolean",
    Character = "[] Character",
    Class = "[] Class",
    Color = "[] Color",
    Constant = "[] Constant",
    Constructor = "[] Constructor",
    Enum = "[] Enum",
    EnumMember = "[] EnumMember",
    Event = "[ﳅ] Event",
    Field = "[] Field",
    File = "[] File",
    Folder = "[ﱮ] Folder",
    Function = "[ﬦ] Function",
    Interface = "[] Interface",
    Keyword = "[] Keyword",
    Method = "[] Method",
    Module = "[] Module",
    Number = "[] Number",
    Operator = "[Ψ] Operator",
    Parameter = "[] Parameter",
    Property = "[ﭬ] Property",
    Reference = "[] Reference",
    Snippet = "[] Snippet",
    String = "[] String",
    Struct = "[ﯟ] Struct",
    Text = "[] Text",
    TypeParameter = "[] TypeParameter",
    Unit = "[] Unit",
    Value = "[] Value",
    Variable = "[ﳛ] Variable",
    Copilot = "",
  },
}

local minimal = {
  -- Lualine
  separators = { left = "|", right = "|" },
  component_separators = { left = "|", right = "|" },
  mode = "",
  branch = "",

  -- Dashboard (snacks)
  dashboard = {
    new_file = "[N] ",
    find_file = "[F] ",
    recent = "[R] ",
    settings = "[C] ",
    session = "[S] ",
    lazy = "[L] ",
    quit = "[Q] ",
    browse = "[B] ",
    git = "[G] ",
    projects = "[P] ",
  },

  -- Notifications (mini.notify)
  notify = {
    ERROR = "[E]",
    WARN = "[W]",
    INFO = "[I]",
    DEBUG = "[D]",
    TRACE = "[T]",
    OFF = "[-]",
  },

  -- TODO comments
  todo = {
    TODO = "[T] ",
    FIXME = "[!] ",
    NOTE = "[i] ",
  },

  -- Markdown rendering
  markdown = {
    headings = { "# ", "## ", "### ", "#### ", "##### ", "###### " },
    bullets = { "*", "-", "+", ">" },
    checkbox_unchecked = "[ ] ",
    checkbox_checked = "[x] ",
    quote = "> ",
    hyperlink = "[L] ",
    image = "[I] ",
  },

  -- LSP status
  lsp = "[LSP] ",
  venv = "[env] ",

  -- Gitsigns (ASCII)
  gitsigns = {
    add = "+",
    change = "~",
    delete = "_",
    topdelete = "^",
    changedelete = "~",
  },

  -- Which-key
  whichkey = {
    breadcrumb = ">",
    separator = "->",
    group = "+",
  },

  -- Completion (blink.cmp) - bez ikon Nerd Font
  nerd_font_variant = "normal",
  kind_icons = {
    Boolean = "Bool",
    Character = "Char",
    Class = "Class",
    Color = "Color",
    Constant = "Const",
    Constructor = "Ctor",
    Enum = "Enum",
    EnumMember = "EnumM",
    Event = "Event",
    Field = "Field",
    File = "File",
    Folder = "Dir",
    Function = "Func",
    Interface = "Iface",
    Keyword = "Kwd",
    Method = "Meth",
    Module = "Mod",
    Number = "Num",
    Operator = "Op",
    Parameter = "Param",
    Property = "Prop",
    Reference = "Ref",
    Snippet = "Snip",
    String = "Str",
    Struct = "Struct",
    Text = "Text",
    TypeParameter = "TParam",
    Unit = "Unit",
    Value = "Val",
    Variable = "Var",
    Copilot = "AI",
  },
}

return env.is_minimal() and minimal or rich
