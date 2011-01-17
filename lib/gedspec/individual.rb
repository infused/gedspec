module Gedspec
  class Individual < Gedspec::Gedcom::Structure
    attribute 'INDI',      :xref
    attribute 'INDI/RESN', :resn, :alias => :restriction_notice
    attribute 'INDI/SEX',  :sex
    attribute 'INDI/NAME', :name, :many => true # TODO: convert to PersonalName
    attribute 'INDI/RFN',  :rfn
    attribute 'INDI/AFN',  :afn
    attribute 'INDI/REFN', :refn, :many => true # TODO: convert to ReferenceNumber
    attribute 'INDI/RIN',  :rin
  end
end