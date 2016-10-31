require_relative '../ProgramAction'
LABS9=
[
  [
    ProgramAction.new("out", "Welcome to Grand Circus\' Room Detail Generator!\n\nEnter Length: "),
    ProgramAction.new("in",  "4\n" ),
    ProgramAction.new("out", "Enter Width: "),
    ProgramAction.new("in",  "2\n" ),
    ProgramAction.new("out", "Area: 8\nPerimeter: 12\n")
  ],
  [
    ProgramAction.new("out", "Welcome to Grand Circus\' Room Detail Generator!\n\nEnter Length: "),
    ProgramAction.new("in",  "4.3\n" ),
    ProgramAction.new("out", "Enter Width: "),
    ProgramAction.new("in",  "2.7\n" ),
    ProgramAction.new("out", "Area: 11.61\nPerimeter: 14\n")
  ]
]