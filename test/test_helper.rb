$:.unshift(File.dirname(__FILE__) + "/../lib/")
require 'rubygems'
require 'test/unit'
require 'mocha'
require 'shoulda'
require 'quietbacktrace'
require 'gedspec'

class Test::Unit::TestCase
  new_backtrace_silencer :shoulda do |line|
    line.include? 'gem/ruby'
  end
  backtrace_silencers << :shoulda
  
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