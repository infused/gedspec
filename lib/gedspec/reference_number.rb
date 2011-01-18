module Gedspec
  class ReferenceNumber < Gedspec::Gedcom::Structure
    attribute 'REFN', :refn, :top_level => true
    attribute 'TYPE', :type
  end
end