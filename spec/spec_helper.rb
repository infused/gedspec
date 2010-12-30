# encoding: utf-8

$:.unshift(File.dirname(__FILE__) + '/../lib/')
require 'rubygems'
require 'rspec'
require 'gedspec'

RSpec.configure do |config|
  def fixture_file(filename)
    File.join(File.dirname(__FILE__), 'fixtures', filename)
  end
  
  def fixture_content(filename)
    File.read fixture_file(filename)
  end
end
