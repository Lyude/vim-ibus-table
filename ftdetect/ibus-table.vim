" Find the first line that isn't a comment, and check if it has the mandatory
" header that tells us that the file is a SCIM format table
au BufNewFile,BufRead *.txt
	\ let line_num = 1 |
	\ let line = getline(line_num) |
	\ while match(line, '^###') == 0 |
	\	let line_num = line_num + 1 |
	\	let line = getline(line_num) |
	\ endwhile |
	\ if line == "SCIM_Generic_Table_Phrase_Library_TEXT" |
	\	set ft=ibus-table |
	\ endif
