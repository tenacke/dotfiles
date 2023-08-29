for file in ~/.{aliases,functions,extra,paths,exports}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
