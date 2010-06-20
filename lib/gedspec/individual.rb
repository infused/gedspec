module Gedspec
  class Individual < Gedspec::Gedcom::StackParser
    ged_attr 'INDI', :xref
    ged_attr 'INDI/RESN', :resn
    ged_attr 'INDI/SEX', :sex
    ged_attr 'INDI/NAME', :name, :many => true
  end
end