# bash-track-test-generator

## This is here for other contributors to the bash track on erxercism.io

- The files are kept in directories that match the directories they have in `exercism/bash`.
- There is no exercises directory here, so examples of templates will go into their own folder in template_examples.
- The results of tests I update with this tool will go into the dir `updated_tests`, and I will PR them to the real repo.

#### I still need to work on the documentation for this project
- For now, let it suffice to know that If you have the `exercism/bash` and `exercism/problem-specifications` repos in parallel on your local developement envorinment then you can generate a test by making a template, putting it in the `.meta` folder of the exercise, and running `bin/generate_test <exercise-slug>`.  If there is a problem in the template that causes `script/test_generator.rb` to exit with a non-zero status then the bash wrapper will revert the test to its state from before the generator began.

- Let me know if you have any questions or suggestions!
