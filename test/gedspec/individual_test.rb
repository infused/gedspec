require 'test_helper'

class Gedspec::IndividualTest < Test::Unit::TestCase
  
  def setup
    @indi = Gedspec::Individual.new
  end
  
  should "load" do
    assert_kind_of Gedspec::Individual, @indi
  end
  
  should "have many names" do
    assert_kind_of Array, @indi.names
  end
  
  should "have a primary name" do
    assert_equal @indi.names.first, @indi.name
  end
  
end