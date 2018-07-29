# bash-track-test-generator

## This is here for other contributors to the bash track on exercism.io

Read below for instruction on using this program

*DISCLAIMER* I still haven't checked to see how backwards compatible this
program is.  Anyone willing to check the earliest version of Ruby with
which this works would be my hero!

## Usage

- run `./generate_test <exercise-slug> override` from the root of this repo.
  - override is optional and requires a json file with extra tests named
    override be present in the directory for the problem.
  - This requires that you have already made a template file for problem
- *See the getting started section below for tutorials*

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

## Getting Started

- First fork this project to your GitHub.com account and clone it
  to your developement environment.
- Make a branch for the exercise you want to update.
- There are dirs for all existing problems already.
  - Each of them already has at least a copy of the example_template.erb
    located in lib in their directory.
  - for some problems this example template will actually work.
- Make necessarry changes to the template.
- Run `./generate_test <exercise-slug>` from the root of the repo.
- If everything went fine then comment out the skips in the test and
  run `bats test_name_here.sh` from the problem directory.
- If all the tests pass then you are ready to copy it over to your clone
  of the exercism/bash repo.  If not please check the test for errors
  and see if the solution needs tweaking to pass any new edge cases.
  - For your convenience the example.sh file has been pulled from the main
    repo, so you can run bats and tweak the test.
  - Don't worry. If you have to regenerate the test and have already
    started tweaking the test this generator tries to be smart, so it will
    not overwrite the renamed copy of the exampple.sh file once it is in
    the directory.
  - That means that, if you are updating an exercise that has been dormant
    for awhile you should delete the `exercise_name.sh` file before
    generating so that you know you got the freshest version of the
    solution.

#### Tutorials

- [First Steps](https://asciinema.org/a/hHo5G6cTeK2eDJOEYBbFBTq6B)

- There will more tutorials coming soon. Some walking through the codebase
  and some exploring other features like the override.

#### I still need to work on the documentation for this project
- For now, let it suffice to know that If you have the `exercism/bash` and `exercism/problem-specifications` repos in parallel on your local developement envorinment then you can generate a test by making a template, putting it in the `.meta` folder of the exercise, and running `bin/generate_test <exercise-slug>`.  If there is a problem in the template that causes `script/test_generator.rb` to exit with a non-zero status then the bash wrapper will revert the test to its state from before the generator began.

- Let me know if you have any questions or suggestions!
