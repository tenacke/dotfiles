for file in ~/.{paths,exports}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
