#!/bin/sh

set -e

main() {
  display_version

  expect -f login.expect dcos

  if [ -z "$WERCKER_DCOS_COMMAND" ]; then
    fail "wercker-dcos: command argument cannot be empty"
  fi

  local cmd="$WERCKER_DCOS_COMMAND"

  info "Running dcos command"
  if [ "$WERCKER_DCOS_DEBUG" = "true" ]; then
    info "dcos $cmd"
  fi

  eval "$WERCKER_STEP_ROOT"/dcos "$cmd"
}

display_version() {
  info "Running dcos version:"
  "$WERCKER_STEP_ROOT"/dcos --version
  echo ""
}

main;
