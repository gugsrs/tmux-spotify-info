#!/usr/bin/env bats

source scripts/utils.sh

setup() {
    echo "setup"
	tmux_status_right="$(tmux show-option -gqv status-right)" # save option value to be restored later
	tmux set-option -gq status-right "test"
}

teardown() {
    echo "teardown"
	tmux set-option -gq status-right "$tmux_status_right" # restore option value
}

@test "test_get_tmux_option" {
  run get_tmux_option status-right
  [ "$status" -eq 0 ]
  [ "$output" = "test" ]
}

@test "test_get_tmux_option_invalid_option" {
  run get_tmux_option invalid-option
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
}

@test "test_get_tmux_option_with_default_value" {
  run get_tmux_option option-not-setted default-value
  [ "$status" -eq 0 ]
  [ "$output" = "default-value" ]
}

@test "test_get_tmux_option_with_existing_value_and_default_value" {
  run get_tmux_option status-right default-value
  [ "$status" -eq 0 ]
  [ "$output" = "test" ]
}

@test "test_set_tmux_option" {
  run set_tmux_option status-right new-value
  [ "$status" -eq 0 ]
  run tmux show-option -gqv status-right
  [ "$output" = "new-value" ]
}
