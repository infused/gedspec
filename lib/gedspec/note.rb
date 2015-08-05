module Gedspec
  class Note < Gedspec::Gedcom::Structure
    attribute 'REFN', :refn, many: true # TODO: convert to ReferenceNumbers
  end
end
