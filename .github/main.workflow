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
  runs = ["sh","-c","/entrypoint.sh test/sequence.basic.puml -o .output/ && diff -q test/sequence.basic.png test/.output/sequence.basic.png"]
}
