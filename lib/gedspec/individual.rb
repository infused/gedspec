module Gedspec
  class Individual
    attr_accessor :xref
    attr_accessor :resn
    
    include Gedspec::Gedcom::StackParser
    
    def initialize(gedcom_structure = nil, *args)
      super
      
      tag_start 'INDI', :get_xref
      tag_start 'INDI/RESN', :get_resn
    end
    
    def get_xref(data, params)
      @xref = data
    end
    
    def get_resn(date, params)
      @resn = date
    end
    
    def names
      @names ||= []
    end
    
    def name
      names.first
    end
  end
end