workflow "Build and Test" {
  on = "push"
  resolves = ["Shell Lint", "Docker Lint", "Integration Test"]
}

action "Shell Lint" {
  uses = "actions/bin/shellcheck@master"
  args = "entrypoint.sh"
}

action "Docker Lint" {
  uses = "docker://replicated/dockerfilelint"
  args = ["Dockerfile"]
}

action "Integration Test" {
  uses = "./"
  runs = ["/app/integration_test.sh"]
}
