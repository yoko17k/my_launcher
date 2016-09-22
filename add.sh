#!/bin/sh
if [ $# -lt 1 ]; then
	cat <<-EOF
		l add "<name>"
	EOF
elif [ $# -lt 2 ]; then
	cat <<-EOF
		l add name "<path>"
	EOF
else
	ARGS=${@:2}
	sed -i '' -e 's%case "$1" in%case "$1" in\
		"'"$1"'" )\
			'"$ARGS"' \
		;;%' 'l のコピー.sh'
fi