# Github Action for PlantUML
Github Action to allow generating outputs from [PlantUML](http://plantuml.com) files

## Documentation

Please see the [PlantUML CLI documentation](http://plantuml.com/command-line) for details

## How to use

To use this action we need a PlantUML *.puml file.  By default, a PNG image will be generated in the same directory for each *.puml file you provide

In your project create a new workflow file `.github/main.workflow`:
```
workflow "Generate PlantUML Images" {
  resolves = ["Generate UML"]
  on = "push"
}

action "Generate UML" {
  uses = "lokkju/github-action-plantuml@master"
  args = ["uml/example.puml"]
}

```

This will generate a PNG image for the example.puml file.

## Notes

This action only runs the PlantUML generation currently.  You will need to chain it with other actions in order to commit the newly created output files.

## TODO

- Only run if the input puml files have been changed
- Automatically commit generated output files
