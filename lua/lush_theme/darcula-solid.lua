local lush = require('lush')
local hsl = lush.hsl

-- Base colors
local bg      = hsl('#252526')    -- base background
local overbg  = hsl('#313234')    -- other backgrounds
local subtle  = hsl('#353638')    -- out-of-buffer elements

local cursor  = hsl('#f7f7f7')
local fg      = hsl('#cfd2d5')
local comment = hsl('#8a8a8a')    -- comments
local mid     = hsl('#383839')   -- either foreground or background
local faded   = hsl('#585e65')    -- non-important text elements
local pop     = hsl('#ffffff')

-- TODO: Convert these colors from hsl to hex
local red     = hsl(1, 77, 59)
local orange  = hsl(27, 61, 50)
local yellow  = hsl(37, 100, 71)
local green   = hsl(83, 27, 53)
local blue    = hsl(215, 80, 73)
local magenta = hsl(310,  40, 70)

---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
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
    ColorColumn    { bg=overbg }, -- Columns set with 'colorcolumn'
    Conceal        { fg=hsl(0, 0, 25) }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor         { fg=bg,      bg=cursor }, -- Character under the cursor
    CurSearch      { fg=bg,      bg=yellow }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
    -- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
    CursorColumn   { bg=overbg }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine     { CursorColumn }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory      { fg=hsl('#87949b') }, -- Directory names (and other special names in listings)
    DiffAdd        { fg=green }, -- Diff mode: Added line |diff.txt|
    DiffChange     { fg=yellow }, -- Diff mode: Changed line |diff.txt|
    DiffDelete     { fg=red }, -- Diff mode: Deleted line |diff.txt|
    DiffText       { DiffChange, gui="underline" }, -- Diff mode: Changed text within a changed line |diff.txt|
    -- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    TermCursor     { fg=bg,      bg=cursor }, -- Cursor in a focused terminal
    -- TermCursorNC   { }, -- Cursor in an unfocused terminal
    ErrorMsg       { fg=red }, -- Error messages on the command line
    VertSplit      { fg=overbg,  bg=bg }, -- Column separating vertically split windows
    Folded         { fg=comment, bg=overbg }, -- Line used for closed folds
    FoldColumn     { fg=faded }, -- 'foldcolumn'
    SignColumn     { FoldColumn }, -- Column where |signs| are displayed
    IncSearch      { CurSearch }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute     { CurSearch }, -- |:substitute| replacement text highlighting
    LineNr         { fg=faded }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    -- LineNrAbove    { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
    -- LineNrBelow    { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
    CursorLineNr   { fg=orange }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    -- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
    -- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
    MatchParen     { fg=pop,     bg=mid }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg        { fg=faded }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea        { fg=fg,      bg=bg }, -- Area for messages and cmdline
    MsgSeparator   { fg=orange }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg        { fg=green }, -- |more-prompt|
    NonText        { fg=fg,      bg=bg }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal         { fg=fg,      bg=bg }, -- Normal text
    NormalFloat    { NonText }, -- Normal text in floating windows.
    -- FloatBorder    { }, -- Border of floating windows.
    -- FloatTitle     { }, -- Title of floating windows.
    NormalNC       { fg=fg,      bg=bg.da(10) }, -- normal text in non-current windows
    Pmenu          { bg=overbg }, -- Popup menu: Normal item.
    PmenuSel       { bg=mid }, -- Popup menu: Selected item.
    -- PmenuKind      { }, -- Popup menu: Normal item "kind"
    -- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
    -- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
    -- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
    PmenuSbar      { Pmenu }, -- Popup menu: Scrollbar.
    PmenuThumb     { PmenuSel }, -- Popup menu: Thumb of the scrollbar.
    Question       { fg=green }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine   { fg=pop }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search         { CurSearch }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    SpecialKey     { fg=mid }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad       { fg=red,     gui="underline" }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap       { fg=magenta, gui="underline" }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal     { fg=orange,  gui="underline" }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare      { fg=yellow,  gui="underline" }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine     { bg=subtle }, -- Status line of current window
    StatusLineNC   { fg=faded,   bg=overbg }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine        { bg=mid }, -- Tab pages line, not active tab page label
    TabLineFill    { bg=overbg }, -- Tab pages line, where there are no labels
    TabLineSel     { bg=faded }, -- Tab pages line, active tab page label
    Title          { fg=blue }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual         { bg=mid }, -- Visual mode selection
    VisualNOS      { bg=subtle }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg     { fg=red }, -- Warning messages
    Whitespace     { fg=mid }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- Winseparator   { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    WildMenu       { Pmenu }, -- Current match in 'wildmenu' completion
    -- WinBar         { }, -- Window bar of current window
    -- WinBarNC       { }, -- Window bar of not-current windows

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.
    --
    Comment        { fg=comment,  gui="italic" }, -- Any comment

    Constant       { fg=orange }, -- (*) Any constant
    String         { fg=green }, --   A string constant: "this is a string"
    Character      { Constant }, --   A character constant: 'c', '\n'
    Number         { fg=blue }, --   A number constant: 234, 0xff
    Boolean        { Constant }, --   A boolean constant: TRUE, false
    Float          { Number }, --   A floating point constant: 2.3e10

    Identifier     { fg=fg }, -- (*) Any variable name
    Function       { fg=yellow }, --   Function name (also: methods for classes)

    Statement      { Constant }, -- (*) Any statement
    Conditional    { Constant }, --   if, then, else, endif, switch, etc.
    Repeat         { Constant }, --   for, do, while, etc.
    Label          { Constant }, --   case, default, etc.
    Operator       { fg=fg }, --   "sizeof", "+", "*", etc.
    Keyword        { Constant }, --   any other keyword
    Exception      { fg=red }, --   try, catch, throw

    PreProc        { Constant }, -- (*) Generic Preprocessor
    Include        { Constant }, --   Preprocessor #include
    Define         { Constant }, --   Preprocessor #define
    Macro          { Constant }, --   Same as Define
    PreCondit      { Constant }, --   Preprocessor #if, #else, #endif, etc.

    Type           { fg=fg }, -- (*) int, long, char, etc.
    StorageClass   { fg=magenta }, --   static, register, volatile, etc.
    Structure      { StorageClass }, --   struct, union, enum, etc.
    Typedef        { Type }, --   A typedef

    Special        { Normal }, -- (*) Any special symbol
    SpecialChar    { Normal }, --   Special character in a constant
    Tag            { fg=yellow }, --   You can use CTRL-] on this
    Delimiter      { Constant }, --   Character that needs attention
    SpecialComment { Constant }, --   Special things inside a comment (e.g. '\n')
    Debug          { Constant }, --   Debugging statements

    Underlined     { gui = "underline" }, -- Text that stands out, HTML links
    Ignore         { fg=faded }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error          { fg=red }, -- Any erroneous construct
    Todo           { gui = "bold" }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.
    --
    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    LspReferenceText            { bg=mid } , -- Used for highlighting "text" references
    LspReferenceRead            { LspReferenceText } , -- Used for highlighting "read" references
    LspReferenceWrite           { LspReferenceText } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.
    --
    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- DiagnosticError            { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticWarn             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticInfo             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticHint             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticOk               { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
    -- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
    -- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
    -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
    -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
    -- DiagnosticUnderlineOk      { } , -- Used to underline "Ok" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
    -- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
    -- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

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
}
end)

return theme
