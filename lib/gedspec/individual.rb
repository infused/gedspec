module Gedspec
  class Individual
    attr_accessor :xref
    
    include Gedspec::GedcomStackParser
    
    def initialize(gedcom_structure = nil, *args)
      super
      
      tag_start 'INDI', :get_gedcom_id
    end
    
    def get_gedcom_id(data, params)
      @xref = data
    end
    
    def names
      @names ||= []
    end
    
    def name
      names.first
    end
  end
end