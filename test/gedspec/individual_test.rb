require 'test_helper'

class Gedspec::IndividualTest < Test::Unit::TestCase
  
  should 'load' do
    @indi = Gedspec::Individual.new
    assert_kind_of Gedspec::Individual, @indi
  end
  
  should 'have many names' do
    @indi = Gedspec::Individual.new
    assert_kind_of Array, @indi.names
  end
  
  should 'have a primary name' do
    @indi = Gedspec::Individual.new
    assert_equal @indi.names.first, @indi.name
  end
  
  should 'parse xref' do
    @indi = Gedspec::Individual.new('0 @I1@ INDI')
    @indi.parse
    assert_equal '@I1@', @indi.xref
  end
  
  should 'parse sex' do
    @indi = Gedspec::Individual.new("0 @I1@ INDI\n1 SEX M")
  end
  
end