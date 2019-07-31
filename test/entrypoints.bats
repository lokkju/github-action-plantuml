#!/usr/bin/env bats

PATH="$PATH:$BATS_TEST_DIRNAME/bin"

function setup() {
  # Ensure GITHUB_WORKSPACE is set
  export GITHUB_WORKSPACE="${GITHUB_WORKSPACE-"${BATS_TEST_DIRNAME}/.."}"
}

@test "entrypoint runs successfully" {
  run $GITHUB_WORKSPACE/entrypoint.sh help
  echo "$output"
  [ "$status" -eq 0 ]
}

@test "correctly generates PNG from UML" {
  run $GITHUB_WORKSPACE/entrypoint.sh help
  [ "$status" -eq 0 ]
  run cat $NPM_CONFIG_USERCONFIG
  [ "${lines[0]}" = "//someOtherRegistry.someDomain.net/:_authToken=NPM_AUTH_TOKEN" ]
  [ "${lines[1]}" = "registry=http://someOtherRegistry.someDomain.net" ]
  [ "${lines[2]}" = "strict-ssl=false" ]
}
