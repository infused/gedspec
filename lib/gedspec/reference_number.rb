module Gedspec
  class ReferenceNumber < Gedspec::Gedcom::Structure
    attr 'REFN',      :refn
    attr 'REFN/TYPE', :type
  end
end