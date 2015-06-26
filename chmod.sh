#! /bin/sh

sh_regex=".*\.sh$"
sh_perms="755"

editor=$(which "$1")
shift

if [ -z "$editor" ] ; then
	echo "Unable to find editor. Check name/path for typos?"
	exit 1
fi

for arg in "$@" ; do
	if [ ! -e "$arg" ] && echo "$arg" | grep -q "$sh_regex" ; then
		touch "$arg" && chmod $sh_perms "$arg"
	fi
done

"$editor" "$@"
