module Gedspec
  class Individual < Gedspec::Gedcom::StackParser
    attr 'INDI',      :xref
    attr 'INDI/RESN', :resn, :alias => :restriction_notice
    attr 'INDI/SEX',  :sex
    attr 'INDI/NAME', :name, :many => true
  end
end