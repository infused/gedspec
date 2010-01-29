module Gedspec
  class Individual < Gedspec::Gedcom::StackParser
    ged_attr 'INDI', :xref
    ged_attr 'INDI/RESN', :resn
    ged_attr 'INDI/SEX', :sex
    
    def names
      @names ||= []
    end
    
    def name
      names.first
    end
  end
end