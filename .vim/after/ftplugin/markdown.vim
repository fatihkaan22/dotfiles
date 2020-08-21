setlocal wrap 
" setlocal spell spelllang=en_us
setlocal formatoptions=1
setlocal linebreak

" Limelight
" Goyo

noremap <leader>e :call ScrollEditToggle()<cr>

let s:scroll_edit_enabled = 0

function! ScrollEditToggle () 
	if s:scroll_edit_enabled
		unmap j
		unmap k
		let s:scroll_edit_enabled = 0
	else
		nnoremap j jzt
		nnoremap k kzt
		let s:scroll_edit_enabled = 1
	endif
endfunction

" call ScrollEditToggle()

"dont use
function! GitbookFormat ()
	%s/\$/\$\$/g
	normal! gg5wcwgitbook
endfunction

"dont use
function! MarkdownPreviewFormat ()
	%s/\$\$/\$/g
	normal! gg5wcwmarkdownPreview
endfunction

"use this
"it replaces all $ with $$ or reverse for katex
function! MdToggle ()
	if getline(1) =~ "gitbook"
		call MarkdownPreviewFormat()
	elseif getline(1) =~ "markdownPreview"
		call GitbookFormat()
	else
		call append(0, "[comment]: # ()")
		normal! gg4wligitbook or markdownPreview
	endif
endfunction
