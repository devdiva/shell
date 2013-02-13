(*
	Open the current Document in Marked.
	Disable option if file type is not a valid markdown-ey type
	
	.markdown
	.mdown
	.mkdn
	.md
	.mkd
	.mdwn
	.mdtxt
	.mdtext
	.text
	.txt
	.taskpaper
	
*)

to getFirstBbDocAlias()
	tell application "BBEdit"
		if the first text document exists then
			get the first text document's file as alias
		else
			false
		end if
	end tell
	return result
end getFirstBbDocAlias

to getFolderPosixPath for a_doc_alias
	tell application "Finder"
		if a_doc_alias exists then
			get the quoted form of the POSIX path of the (folder of a_doc_alias as text)
		else
			"~"
		end if
	end tell
	return result
end getFolderPosixPath

to tellMarked to do_something
	tell application "Marked"
		(*
		if (the first window whose busy is false) exists then
			set win to the first window whose busy is false
			set frontmost of win to true
			do script do_something in win
		else
			do script do_something
		end if
		activate
		*)
		
	end tell
end tellMarked

getFolderPosixPath for the getFirstBbDocAlias()
tellMarked to "open " & result

