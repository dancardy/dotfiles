function! AlignOnString(target_string) range
	if a:lastline <= a:firstline
		echo "Error: At least two lines need to be selected."
		return
	endif

	" Save location of first instance of target string on each line
	let l:line_on = a:firstline
	let l:positions=[]
	while l:line_on <= a:lastline
		let l:posiions = add(
				\ l:positions,
				\ stridx(getline(l:line_on),a:target_string))
		let l:line_on += 1
	endwhile

	let l:target_column = max(l:positions)
	let l:line_on = a:firstline
	let l:index = 0
	while l:line_on <= a:lastline
		" Find number of spaces to add to this line
		if l:positions[l:index] ==# -1
			let l:spaces_needed = 0
		else
			let l:spaces_needed = l:target_column - l:positions[l:index]
		endif

		" Insert spaces into l:substitute_pattern
		let l:spaces_remaining = l:spaces_needed
		let l:substitute_pattern = ''
		while l:spaces_remaining > 0
			let l:substitute_pattern = l:substitute_pattern . ' '
			let l:spaces_remaining -= 1
		endwhile
		let l:substitute_pattern = l:substitute_pattern . a:target_string

		" Replace first instance of target_string with the pattern
		let l:curr_line = getline(l:line_on)
		let l:new_line = substitute(
				\ l:curr_line,
				\ a:target_string . '\C',
				\ l:substitute_pattern, '')
		call setline(l:line_on, l:new_line)

		let l:line_on += 1
		let l:index += 1
	endwhile
endfunction

