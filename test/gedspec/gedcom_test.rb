require 'test_helper'

class Gedspec::GedcomTest < Test::Unit::TestCase
  
  def setup
    @gedcom = Gedspec::Gedcom.new
  end
  
  should 'load' do
    assert_kind_of Gedspec::Gedcom, @gedcom
  end
  
end