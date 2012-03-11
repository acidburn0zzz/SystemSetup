syntax on

colorscheme elflord

highlight ExtraWhitespace ctermbg=red guibg=red

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd InsertLeave * redraw

match ExtraWhitespace /\s+\%#\@<!$/
