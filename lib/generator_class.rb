# test generator class for the bash track

###
# This class allows simple ERB templates to generate tests from the
# canonical-data.json file stored in the problem-specifications repo
# for each exercise.
#
# This class is invoked by the test_generator.rb script which is
# called by the wrapper bin/generate_test written in bash.
#
# For clarification on this project please checkout the dicumentation
# at TODO
###

require 'erb'

# make the class
class TestGenerator

  include ERB::Util # We need Util from ERB

  ###
  # attr_accessor lets us manipulate these variable from outside
  # of the object with ease.
  ###
  attr_accessor :data_map, :test_map, :template, :converted_slug

  ###
  # The function initialize will run at new instanitiation of our class.
  # It will then set the variables defined within it.
  ###
  def initialize(slug)
    # convert the slug
    @converted_slug = convert_slug(slug)

    # the run string inside the test
    @run_string = "run bash #{converted_slug}.sh"

    # the name for the test file
    @test_name = "./exercises/#{slug}/#{@converted_slug}_test.sh"

    # this converts the raw json to a ruby struct
    @data_map = get_canonical(slug)

    # this private method gets us to the proper layer in the nested struct
    get_test_map
  end

  # load the override json if the option is passed
  def load_override(path)
    override_source = JSON.parse(File.read(path))
    override_source.each {|hash| @test_map << hash}
  end

  # descriptive name for calling the private method 'save'
  def generate
    save
  end

  private # private methods can only be accessed by the object itself
  def convert_slug(slug)
    slug.gsub('-', '_')
  end

  ###
  # This method puts each object in the cases object from the parsed json
  # into the array @test_map for easy iteration in the template files
  ###
  def get_test_map
    @test_map = Array.new
    @data_map["cases"].each do |hash|
      @test_map << hash
    end
  end

  ###
  # A new ERB object is instantiated and the template is loaded.
  # Safe level is set to nil (as this isn't public facing).
  # Trim mode is set to '-' so that '-%>' will trim following newlines.
  # 'binding' is passed to #result so that variables from this object
  # can be accessed from the template.
  #
  # See the docs here TODO for more information about this.
  ###
  def render
    ERB.new(@template, nil, '-').result(binding)
  end

  ###
  # Open the file to overwrite or blank if it doesn't exist -
  # it doesn't exist we moved it with the wrapper; remember?
  # Write the output of our render method from above to the file.
  ###
  def save
    File.open(@test_name, "w+") do |file|
      file.write(render)
    end
  end
end
