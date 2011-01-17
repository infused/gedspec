module Gedspec
  class Individual < Gedspec::Gedcom::Structure
    attr 'INDI',      :xref
    attr 'INDI/RESN', :resn, :alias => :restriction_notice
    attr 'INDI/SEX',  :sex
    attr 'INDI/NAME', :name, :many => true # TODO: convert to PersonalName
    attr 'INDI/RFN',  :rfn
    attr 'INDI/AFN',  :afn
    attr 'INDI/REFN', :refn, :many => true # TODO: convert to ReferenceNumber
    attr 'INDI/RIN',  :rin
  end
end