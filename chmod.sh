#! /bin/sh

sh_regex=".*\.sh$"
sh_perms="755"

editor=$1
shift

for arg in "$@" ; do
	if [ ! -e "$arg" ] && echo "$arg" | grep -q "$sh_regex" ; then
		touch "$arg" && chmod $sh_perms "$arg"
	fi
done

/usr/bin/"$editor" "$@"
