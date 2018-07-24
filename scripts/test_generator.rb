#!/bin/ruby

###
# This script invokes the TestGenerator class defined in
# lib/generator_class.rb with the arguments validated and passed from
# the bash wrapper bin/generate_test
#
# for decumentation regarding this tool please check TODO
###

require 'erb' # Need to import embedded ruby for processing templates
require 'json' # Need to import json for parsing the canonical data
require_relative '../lib/generator_class.rb' # Import our class

# Handle the arguments pssed in by the wrapper
converted_slug, path_to_exercise, canonical_data = ARGV[0], ARGV[1], ARGV[2]

# Change the converted slug into the full pathname for the test file
path_to_test = "#{path_to_exercise}#{converted_slug}_test.sh"

# Add suffix to get proper path for the template
path_to_template = "#{path_to_exercise}.meta/generator_template.erb"

# Start a new instance of our TestGenerator class
new_test = TestGenerator.new(converted_slug, path_to_test, canonical_data)

# Load the template into the class instance
new_test.template = File.read(path_to_template)

# Finally generate the test_file
new_test.generate

