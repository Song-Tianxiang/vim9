vim9script

var lspServers = [
    # Clangd language server
    {
        name: 'clangd',
        filetype: ['c', 'cpp'],
        path: 'clangd',
        args: ['--background-index']
    },

    # Rust language server
    {
        name: 'rustanalyzer',
        filetype: ['rust'],
        path: 'rust-analyzer',
        args: [],
        syncInit: true,
    },

    # Go language server
    # {
    #     name: 'golang',
    #     filetype: ['go', 'gomod'],
    #     path: '/usr/local/bin/gopls',
    #     args: ['serve'],
    #     syncInit: v:true
    # }
]

var lspkinds = {
  Text: "󰉿",
  Method: "󰆧",
  Function: "󰘧",
  Constructor: "",
  Field: "󰜢",
  Variable: "󰀫",
  Class: "󰠱",
  Interface: "",
  Module: "",
  Property: "󰜢",
  Unit: "󰑭",
  Value: "󰎠",
  Enum: "",
  Keyword: "󰌋",
  Snippet: "",
  Color: "󰏘",
  File: "󰈚",
  Reference: "󰈇",
  Folder: "󰉋",
  EnumMember: "",
  Constant: "󰏿",
  Struct: "󰙅",
  Event: "",
  Operator: "󰆕",
  TypeParameter: "󰊄",
  Buffer: ""
}

var lspOpts = {
    omnicompl: true,
    autoComplete: false,
    completionMatcher: 'fuzzy',
    customCompletionKinds: true,
    completionKinds: lspkinds,
    noNewlineInCompletion: false,

    semanticHighlight: true,

    showDiagOnStatusLine: true,
    showDiagWithVirtualText: false,
    diagVirtualTextAlign: "after",
    showInlayHints: false,

    usePopupInCodeAction: true,

    useBufferCompletion: true,
    outlineOnRight: true,
    outlineWinSize: 30,

    completionTextEdit: false,
    snippetSupport: true,
    vsnipSupport: true,
}

augroup lsp
    au!
    autocmd VimEnter * {
        g:LspAddServer(lspServers)
        g:LspOptionsSet(lspOpts)
    }
augroup END

augroup lsp-attached
    au!
    autocmd User LspAttached {
        setlocal keywordprg=:LspHover
        setlocal tagfunc=lsp#lsp#TagFunc
        setlocal formatexpr=lsp#lsp#FormatExpr()
    }
    autocmd FileType c,cpp,rust doau User LspAttached
augroup END
