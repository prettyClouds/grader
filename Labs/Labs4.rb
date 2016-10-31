require_relative '../ProgramAction'
LABS4=
[
  [
    ProgramAction.new("out", "Welcome to the Factorial Calculator!\n\nEnter an integer that's greater than 0 but less than 10: "),
    ProgramAction.new("in",  "4\n" ),
    ProgramAction.new("out", "The factorial of 4 is 24.\n")
  ],
  [
    ProgramAction.new("out", "Welcome to the Factorial Calculator!\n\nEnter an integer that's greater than 0 but less than 10: "),
    ProgramAction.new("in",  "4\n" ),
    ProgramAction.new("out", "The factorial of 4 is 24.\n\nContinue? (y/n): "),
    ProgramAction.new("in",  "y\n" ),
    ProgramAction.new("out", "\nEnter an integer that's greater than 0 but less than 10: "),
    ProgramAction.new("in",  "9\n" ),
    ProgramAction.new("out", "The factorial of 9 is 362880.\n\nContinue? (y/n): ")
  ]
]