#!/bin/bash

case $BLOCK_BUTTON in
	1) sp play ;;
	4) sp next ;;
	5) sp prev ;;
esac

if sp status 2> /dev/null | grep 'Paused' > /dev/null; then
	printf '\xef\x81\x8c '
else
	printf '\xef\x81\x8b '
fi
sp current-oneline 2> /dev/null
