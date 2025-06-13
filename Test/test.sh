# **************************************************************************** #
#                                                                              #
#                                                         #        #           #
#    test.sh                                             #      +   #          #
#                                                       #      +     #         #
#    By: Gerardo Mtnz. <dev.gmartinez@gmail.com>       #      +       #        #
#                                                       #    +       #         #
#    Created: 2025/05/15 18:31:58 by Gerardo Mtnz.       #  +       #          #
#    Updated: 2025/05/16 03:53:44 by Gerardo Mtnz.        #       #            #
#                                                                              #
# **************************************************************************** #

Prueba Header

function! s:line(n)
	if a:n == 1 || a:n == 11 " top and bottom line
		return s:start . ' ' . repeat(s:fill, s:length - strlen(s:start) - strlen(s:end) - 2) . ' ' . s:end
	elseif a:n == 2 || a:n == 10 " blank line
		return s:textline('', '')
	elseif a:n == 3 || a:n == 5 || a:n == 7 " empty with ascii
		return s:textline('', s:ascii(a:n))
	elseif a:n == 4 " filename
		return s:textline(s:filename(), s:ascii(a:n))
	elseif a:n == 6 " author
		return s:textline("By: " . s:user() . " <" . s:mail() . ">", s:ascii(a:n))
	elseif a:n == 8 " created
		return s:textline("Created: " . s:date() . " by " . s:user(), s:ascii(a:n))
	elseif a:n == 9 " updated
		return s:textline("Updated: " . s:date() . " by " . s:user(), s:ascii(a:n))
	endif
endfunction

function! s:insert()
	let l:line = 11

	" empty line after header
	call append(0, "")

	" loop over lines
	while l:line > 0
		call append(0, s:line(l:line))
		let l:line = l:line - 1
	endwhile
endfunction


