#!/bin/sh

set -e

main() {
  display_version

  DCOS="${WERCKER_STEP_ROOT}/venv/bin/dcos"
  expect -f "$WERCKER_STEP_ROOT/login.expect" "$DCOS"

  if [ -z "$WERCKER_DCOS_COMMAND" ]; then
    fail "wercker-dcos: command argument cannot be empty"
  fi

  local cmd="$WERCKER_DCOS_COMMAND"

  info "Running dcos command"
  if [ "$WERCKER_DCOS_DEBUG" = "true" ]; then
    info "dcos $cmd"
  fi

  eval "$DCOS" "$cmd"
}

display_version() {
  info "Running dcos version:"
  $DCOS --version
  echo ""
}

main;
