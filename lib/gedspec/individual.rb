module Gedspec
  class Individual < Gedspec::Gedcom::Structure
    attribute 'RESN', :resn
    attribute 'SEX',  :sex
    attribute 'NAME', :name, :many => true # TODO: convert to PersonalName
    attribute 'RFN',  :rfn
    attribute 'AFN',  :afn
    attribute 'REFN', :refn, :many => true # TODO: convert to ReferenceNumbers
    attribute 'RIN',  :rin
  end
end
