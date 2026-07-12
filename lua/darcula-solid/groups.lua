local lush = require('lush')
local palette = require('lua.darcula-solid.palette')

---@diagnostic disable: undefined-global
return lush(function(injected_functions)
  local sym = injected_functions.sym

  return {
    -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
    -- groups, mostly used for styling UI elements.
    -- Comment them out and add your own properties to override the defaults.
    -- An empty definition `{}` will clear all styling, leaving elements looking
    -- like the 'Normal' group.
    -- To be able to link to a group, it must already be defined, so you may have
    -- to reorder items as you go.
    --
    -- See :h highlight-groups
    --
    ColorColumn    { bg=palette.subtle_black }, -- Columns set with 'colorcolumn'
    Conceal        { fg=palette.gray }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor         { fg=palette.black,      bg=palette.white }, -- Character under the cursor
    CurSearch      { fg=palette.white,      bg=palette.green }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
    lCursor        { Cursor }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM       { Cursor }, -- Like Cursor, but used when in IME mode |CursorIM|
    CursorColumn   { bg=palette.subtle_black }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine     { CursorColumn }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory      { fg=palette.teal }, -- Directory names (and other special names in listings)
    DiffAdd        { bg=palette.green }, -- Diff mode: Added line |diff.txt|
    DiffChange     { bg=palette.subtle_yellow }, -- Diff mode: Changed line |diff.txt|
    DiffDelete     { bg=palette.red }, -- Diff mode: Deleted line |diff.txt|
    DiffText       { bg=palette.subtle_teal }, -- Diff mode: Changed text within a changed line |diff.txt|
    DiffTextChange { bg=palette.subtle_teal }, -- Diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer    { Conceal }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    TermCursor     { Cursor }, -- Cursor in a focused terminal
    TermCursorNC   { Cursor }, -- Cursor in an unfocused terminal
    ErrorMsg       { fg=palette.red }, -- Error messages on the command line
    VertSplit      { fg=palette.lightgray,  bg=palette.black }, -- Column separating vertically split windows
    Folded         { fg=palette.lightgray, bg=palette.subtle_black }, -- Line used for closed folds
    FoldColumn     { fg=palette.gray }, -- 'foldcolumn'
    SignColumn     { FoldColumn }, -- Column where |signs| are displayed
    IncSearch      { CurSearch }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute     { CurSearch }, -- |:substitute| replacement text highlighting
    LineNr         { fg=palette.gray }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    LineNrAbove    { LineNr }, -- Line number for when the 'relativenumber' option is set, above the cursor line
    LineNrBelow    { LineNr }, -- Line number for when the 'relativenumber' option is set, below the cursor line
    CursorLineNr   { fg=palette.orange }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    CursorLineFold { LineNr }, -- Like FoldColumn when 'cursorline' is set for the cursor line
    CursorLineSign { LineNr }, -- Like SignColumn when 'cursorline' is set for the cursor line
    MatchParen     { fg=palette.white,     bg=palette.subtle_black }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg        { fg=palette.gray }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea        { fg=palette.subtle_white,      bg=palette.black }, -- Area for messages and cmdline
    MsgSeparator   { fg=palette.orange }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg        { fg=palette.subtle_green }, -- |more-prompt|
    NonText        { fg=palette.subtle_white,      bg=palette.black }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal         { fg=palette.subtle_white,      bg=palette.black }, -- Normal text
    NormalFloat    { NonText }, -- Normal text in floating windows.
    FloatBorder    { VertSplit }, -- Border of floating windows.
    FloatTitle     { Normal, gui = 'bold' }, -- Title of floating windows.
    NormalNC       { Normal }, -- normal text in non-current windows
    Pmenu          { Normal, bg=palette.subtle_black }, -- Popup menu: Normal item.
    PmenuSel       { fg=palette.white_subtle, bg=palette.gray, gui = 'bold' }, -- Popup menu: Selected item.
    PmenuKind      { Pmenu }, -- Popup menu: Normal item "kind"
    PmenuKindSel   { PmenuSel }, -- Popup menu: Selected item "kind"
    PmenuExtra     { Pmenu }, -- Popup menu: Normal item "extra text"
    PmenuExtraSel  { PmenuSel }, -- Popup menu: Selected item "extra text"
    PmenuSbar      { bg=palette.subtle_white, fg=palette.black }, -- Popup menu: Scrollbar.
    PmenuThumb     { PmenuSbar }, -- Popup menu: Thumb of the scrollbar.
    Question       { fg=palette.subtle_green }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine   { fg=palette.white }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search         { CurSearch }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    SpecialKey     { Conceal }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad       { sp=palette.red, gui="undercurl" }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap       { sp=palette.magenta, gui="undercurl" }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal     { sp=palette.orange,  gui="undercurl" }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare      { sp=palette.yellow,  gui="undercurl" }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine     { bg=palette.subtle_black }, -- Status line of current window
    StatusLineNC   { StatusLine }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine        { StatusLine }, -- Tab pages line, not active tab page label
    TabLineFill    { StatusLine }, -- Tab pages line, where there are no labels
    TabLineSel     { PmenuSel }, -- Tab pages line, active tab page label
    Title          { fg=palette.blue }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual         { fg=palette.white, bg=palette.blue }, -- Visual mode selection
    VisualNOS      { Visual }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg     { fg=palette.red }, -- Warning messages
    Whitespace     { Conceal }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    Winseparator   { VertSplit }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    WildMenu       { Pmenu }, -- Current match in 'wildmenu' completion
    WinBar         { fg=palette.gray, bg=palette.subtle_black }, -- Window bar of current window
    WinBarNC       { WinBar }, -- Window bar of not-current windows

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.
    --
    Comment        { fg=palette.lightgray,  gui="italic" }, -- Any comment

    Constant       { fg=palette.orange }, -- (*) Any constant
    String         { fg=palette.subtle_green }, --   A string constant: "this is a string"
    Character      { Constant }, --   A character constant: 'c', '\n'
    Number         { fg=palette.blue }, --   A number constant: 234, 0xff
    Boolean        { Constant }, --   A boolean constant: TRUE, false
    Float          { Number }, --   A floating point constant: 2.3e10

    Identifier     { fg=palette.yellow }, -- (*) Any variable name
    Function       { fg=palette.yellow }, --   Function name (also: methods for classes)

    Statement      { Constant }, -- (*) Any statement
    Conditional    { Constant }, --   if, then, else, endif, switch, etc.
    Repeat         { Constant }, --   for, do, while, etc.
    Label          { Constant }, --   case, default, etc.
    Operator       { fg=palette.subtle_white }, --   "sizeof", "+", "*", etc.
    Keyword        { Constant }, --   any other keyword
    Exception      { fg=palette.red }, --   try, catch, throw

    PreProc        { Constant }, -- (*) Generic Preprocessor
    Include        { Constant }, --   Preprocessor #include
    Define         { Constant }, --   Preprocessor #define
    Macro          { Constant }, --   Same as Define
    PreCondit      { Constant }, --   Preprocessor #if, #else, #endif, etc.

    Type           { fg=palette.orange }, -- (*) int, long, char, etc.
    StorageClass   { fg=palette.magenta }, --   static, register, volatile, etc.
    Structure      { StorageClass }, --   struct, union, enum, etc.
    Typedef        { Type }, --   A typedef

    Special        { Normal }, -- (*) Any special symbol
    SpecialChar    { fg=palette.orange }, --   Special character in a constant
    Tag            { fg=palette.yellow }, --   You can use CTRL-] on this
    Delimiter      { Constant }, --   Character that needs attention
    SpecialComment { Constant }, --   Special things inside a comment (e.g. '\n')
    Debug          { Constant }, --   Debugging statements

    Underlined     { gui = "underline" }, -- Text that stands out, HTML links
    Ignore         { fg=palette.gray }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error          { fg=palette.red }, -- Any erroneous construct
    Todo           { gui = "bold" }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.
    --
    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    LspReferenceText            { bg=palette.subtle_yellow } , -- Used for highlighting "text" references
    LspReferenceRead            { LspReferenceText } , -- Used for highlighting "read" references
    LspReferenceWrite           { LspReferenceText } , -- Used for highlighting "write" references
    LspInlayHint                { fg=palette.gray, bg=palette.black},
    LspCodeLens                 { LspInlayHint } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    LspCodeLensSeparator        { LspInlayHint } , -- Used to color the seperator between two or more code lens.
    LspSignatureActiveParameter { LspReferenceText } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.
    --
    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    DiagnosticError            { fg=palette.red }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn             { fg=palette.yellow } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo             { fg=palette.blue } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint             { fg=palette.blue } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticOk               { fg=palette.subtle_green } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticVirtualTextError { DiagnosticError } , -- Used for "Error" diagnostic virtual text.
    DiagnosticVirtualTextWarn  { DiagnosticWarn } , -- Used for "Warn" diagnostic virtual text.
    DiagnosticVirtualTextInfo  { DiagnosticInfo } , -- Used for "Info" diagnostic virtual text.
    DiagnosticVirtualTextHint  { DiagnosticHint } , -- Used for "Hint" diagnostic virtual text.
    DiagnosticVirtualTextOk    { DiagnosticOk } , -- Used for "Ok" diagnostic virtual text.
    DiagnosticUnderlineError   { sp=palette.red, gui="undercurl" } , -- Used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn    { sp=palette.yellow, gui="undercurl" } , -- Used to underline "Warn" diagnostics.
    DiagnosticUnderlineInfo    { sp=palette.blue, gui="undercurl" } , -- Used to underline "Info" diagnostics.
    DiagnosticUnderlineHint    { sp=palette.blue, gui="undercurl" } , -- Used to underline "Hint" diagnostics.
    DiagnosticUnderlineOk      { sp=palette.subtle_green, gui="undercurl" } , -- Used to underline "Ok" diagnostics.
    DiagnosticFloatingError    { DiagnosticError } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    DiagnosticFloatingWarn     { DiagnosticWarn } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    DiagnosticFloatingInfo     { DiagnosticInfo } , -- Used to color "Info" diagnostic messages in diagnostics float.
    DiagnosticFloatingHint     { DiagnosticHint } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    DiagnosticFloatingOk       { DiagnosticOk } , -- Used to color "Ok" diagnostic messages in diagnostics float.
    DiagnosticSignError        { DiagnosticError } , -- Used for "Error" signs in sign column.
    DiagnosticSignWarn         { DiagnosticWarn } , -- Used for "Warn" signs in sign column.
    DiagnosticSignInfo         { DiagnosticInfo } , -- Used for "Info" signs in sign column.
    DiagnosticSignHint         { DiagnosticHint } , -- Used for "Hint" signs in sign column.
    DiagnosticSignOk           { DiagnosticOk } , -- Used for "Ok" signs in sign column.
    DiagnosticDeprecated       { gui="strikethrough" }, -- Used for deprecated or obsolete code. Applied by the "underline" handler; disabled when `vim.diagnostic.config({ underline = false })`.
    DiagnosticUnnecessary      { fg=palette.gray }, -- Used for unnecessary or unused code. Applied by the "underline" handler; disabled when `vim.diagnostic.config({ underline = false })`.

    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function.
    --
    -- sym"@text.literal"      { }, -- Comment
    -- sym"@text.reference"    { }, -- Identifier
    -- sym"@text.title"        { }, -- Title
    -- sym"@text.uri"          { }, -- Underlined
    -- sym"@text.underline"    { }, -- Underlined
    -- sym"@text.todo"         { }, -- Todo
    -- sym"@comment"           { }, -- Comment
    -- sym"@punctuation"       { }, -- Delimiter
    -- sym"@constant"          { }, -- Constant
    -- sym"@constant.builtin"  { }, -- Special
    -- sym"@constant.macro"    { }, -- Define
    -- sym"@define"            { }, -- Define
    -- sym"@macro"             { }, -- Macro
    -- sym"@string"            { }, -- String
    -- sym"@string.escape"     { }, -- SpecialChar
    -- sym"@string.special"    { }, -- SpecialChar
    -- sym"@character"         { }, -- Character
    -- sym"@character.special" { }, -- SpecialChar
    -- sym"@number"            { }, -- Number
    -- sym"@boolean"           { }, -- Boolean
    -- sym"@float"             { }, -- Float
    -- sym"@function"          { }, -- Function
    -- sym"@function.builtin"  { }, -- Special
    -- sym"@function.macro"    { }, -- Macro
    -- sym"@parameter"         { }, -- Identifier
    -- sym"@method"            { }, -- Function
    -- sym"@field"             { }, -- Identifier
    -- sym"@property"          { }, -- Identifier
    -- sym"@constructor"       { }, -- Special
    -- sym"@conditional"       { }, -- Conditional
    -- sym"@repeat"            { }, -- Repeat
    -- sym"@label"             { }, -- Label
    -- sym"@operator"          { }, -- Operator
    -- sym"@keyword"           { }, -- Keyword
    -- sym"@exception"         { }, -- Exception
    -- sym"@variable"          { }, -- Identifier
    -- sym"@type"              { }, -- Type
    -- sym"@type.definition"   { }, -- Typedef
    -- sym"@storageclass"      { }, -- StorageClass
    -- sym"@structure"         { }, -- Structure
    -- sym"@namespace"         { }, -- Identifier
    -- sym"@include"           { }, -- Include
    -- sym"@preproc"           { }, -- PreProc
    -- sym"@debug"             { }, -- Debug
    -- sym"@tag"               { }, -- Tag


    -- Other highlight groups
    gitcommitSummary { fg=palette.subtle_white,      bg=palette.black },
}
end)
