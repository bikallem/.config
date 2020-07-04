let b:ale_lsp_root = '$HOME/stripe/uppsala'
let b:ale_java_eclipselsp_path = '$HOME/.vscode/extensions/redhat.java-0.63.0'
let b:ale_fixers = ['google_java_format']
let b:ale_linters = ['eclipselsp']


let java_highlight_functions = 1
let java_highlight_java_lang_ids = 1
let java_highlight_debug = 1
highlight link javaScopeDecl Statement
highlight link javaType Type
highlight link javaDocTags PreProc
" Disable the comment title color
hi def link javaCommentTitle Comment
