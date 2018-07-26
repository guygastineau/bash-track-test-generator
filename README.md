# bash-track-test-generator

## This is here for other contributors to the bash track on erxercism.io

Read below for instruction on using this program

## Usage

- run `./generate_test <exercise-slug>` from the root of this repo.

## This program now works from this repo

- The structure now houses the template for each exercise within
  the exercises directory.
- When you run this program you must give it a slug as an argument.
- If you have not made a directory for the exercise in the exercises directory
  then this program will not run.
- Additionally you must make a template for the exercise and put it in
  the directory for the exercise in the exercises directory.
- This program pulls the canonical-data.json and the example.sh files from
  the exercism repos.  The example.sh file will be renamed to work with
  the test file so you can check it with bats once the test is
  generated.

#### I still need to work on the documentation for this project
- For now, let it suffice to know that If you have the `exercism/bash` and `exercism/problem-specifications` repos in parallel on your local developement envorinment then you can generate a test by making a template, putting it in the `.meta` folder of the exercise, and running `bin/generate_test <exercise-slug>`.  If there is a problem in the template that causes `script/test_generator.rb` to exit with a non-zero status then the bash wrapper will revert the test to its state from before the generator began.

- Let me know if you have any questions or suggestions!
