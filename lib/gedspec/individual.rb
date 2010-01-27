module Gedspec
  class Individual
    include Gedspec::Gedcom::StackParser
    
    # parse_attribute :xref, 'INDI'
    
    attr_accessor :xref
    attr_accessor :resn
    attr_accessor :sex
    
    def initialize(gedcom_structure = nil, *args)
      super
      
      tag_start 'INDI', :update_attr, {:attr => :@xref}
      tag_start 'INDI/RESN', :update_attr, {:attr => :@resn}
      tag_start 'INDI/SEX', :update_attr, {:attr => :@sex}
    end
    
    def names
      @names ||= []
    end
    
    def name
      names.first
    end
  end
end