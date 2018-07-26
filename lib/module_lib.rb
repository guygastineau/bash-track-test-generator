# Test to read files from the internet

require 'open-uri'
require 'json'

module FetchFile

  URL_BASE = 'https://raw.github.com/exercism/'
  BASH_EXT = 'bash/master/exercises/'
  PROB_SPECS_EXT = 'problem-specifications/master/exercises/'

  def get_canonical(slug)

    url = canonical(slug)
    begin
      JSON.parse(open(url).read)
    rescue
      puts "Error: the canonical-data.json file for #{slug}
        does not exist!"
      exit 1
    end
  end

  def get_example(slug)

    url = bash_example(slug)
    begin
      example = open(url).read
    rescue
      puts "An error occured while fetching the example file."
      exit 1
    end

    example_path = "./exercises/#{slug}/#{@converted_slug}.sh"
    begin
      File.open(example_path, 'w') do |file|
        example.each_line {|line| file.write(line)}
      end
    rescue
      puts "Problem writing the example.sh to exercise directory."
      exit 1
    end
  end

  def canonical(slug)
    "#{URL_BASE}#{PROB_SPECS_EXT}#{slug}/canonical-data.json"
  end

  def bash_example(slug)
    "#{URL_BASE}#{BASH_EXT}#{slug}/example.sh"
  end
end

