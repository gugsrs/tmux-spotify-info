#!/usr/bin/env bats

source spotify-info.tmux

setup() {
    echo "setup"
	tmux_status_right="$(tmux show-option -gqv status-right)" # save option value to be restored later
	tmux set-option -gq status-right "#{spotify-info} my test string"
	spotify_info="spotify_info"
}

teardown() {
    echo "teardown"
	tmux set-option -gq status-right "$tmux_status_right" # restore option value
}

@test "test_do_interpolation" {
  run do_interpolation "#{spotify-info} my test string"
  [ "$status" -eq 0 ]
  [ "$output" = "spotify_info my test string" ]
}

@test "test_do_interpolation_without_arg" {
  run do_interpolation
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
}

@test "test_update_tmux_option" {
  run update_tmux_option status-right
  [ "$status" -eq 0 ]
  run tmux show-option -gqv status-right
  [ "$output" = "spotify_info my test string" ]
}

@test "test_update_tmux_option_without_placeholder" {
  tmux set-option -gq status-right "my test string"
  run update_tmux_option status-right
  [ "$status" -eq 0 ]
  run tmux show-option -gqv status-right
  [ "$output" = "my test string" ]
}
