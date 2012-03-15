syntax on

colorscheme elflord

highlight ExtraWhitespace ctermbg=red guibg=red

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd InsertLeave * redraw

match ExtraWhitespace /\s+\%#\@<!$/

augroup json_autocmd 
  autocmd! 
  autocmd FileType json set autoindent 
  autocmd FileType json set formatoptions=tcq2l 
  autocmd FileType json set textwidth=78 shiftwidth=2 
  autocmd FileType json set softtabstop=2 tabstop=8 
  autocmd FileType json set expandtab 
  autocmd FileType json set foldmethod=syntax 
augroup END 
