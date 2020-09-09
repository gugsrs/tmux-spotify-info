#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$(uname)" == "Darwin" ]; then
	spotify_info="#($CURRENT_DIR/scripts/tmux-spotify-info)"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	spotify_info="#($CURRENT_DIR/scripts/spotify-dbus.sh)"
fi
placeholder="\#{spotify-info}"

source $CURRENT_DIR/scripts/utils.sh

do_interpolation() {
	local string="$1"
	local interpolated="${string/$placeholder/$spotify_info}"
	echo "$interpolated"
}

update_tmux_option() {
	local option="$1"
	local option_value="$(get_tmux_option "$option")"
	local new_option_value="$(do_interpolation "$option_value")"
	set_tmux_option "$option" "$new_option_value"
}

main() {
    update_tmux_option "status-left"
    update_tmux_option "status-right"
}

main
