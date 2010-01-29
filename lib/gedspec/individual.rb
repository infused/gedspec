module Gedspec
  class Individual < Gedspec::Gedcom::StackParser
    ged_attr 'INDI', :xref
    ged_attr 'INDI/RESN', :resn
    ged_attr 'INDI/SEX', :sex
    ged_attr 'INDI/NAME', :name     # TODO: must support multiple names
    
    def initialize(*args)
      super
      @name = []
    end
    
    def name=(new_name)
      @name << new_name
    end
    
    def name
      @name[0]
    end
  end
end