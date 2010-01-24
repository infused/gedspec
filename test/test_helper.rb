$:.unshift(File.dirname(__FILE__) + "/../lib/")
require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'gedspec'

class Test::Unit::TestCase
  def fixture_file(filename)
    File.join(File.dirname(__FILE__), 'fixtures', filename)
  end
  
  def fixture_content(filename)
    path = File.join(File.dirname(__FILE__), 'fixtures', filename)
    file = File.open(path, 'r')
    content = file.read
    file.close
    content
  end
end