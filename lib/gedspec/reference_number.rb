module Gedspec
  class ReferenceNumber < Gedspec::Gedcom::Structure
    attribute 'REFN',      :refn
    attribute 'REFN/TYPE', :type
  end
end