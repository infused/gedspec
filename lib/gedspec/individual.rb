module Gedspec
  class Individual
    attr_accessor :xref
    attr_accessor :resn
    attr_accessor :sex
    
    include Gedspec::Gedcom::StackParser
    
    def initialize(gedcom_structure = nil, *args)
      super
      
      tag_start 'INDI', :update_attr, {:attr => :@xref}
      tag_start 'INDI/RESN', :get_resn, {:attr => :@resn}
      tag_start 'INDI/SEX', :get_sex, {:attr => :@sex}
    end
    
    def names
      @names ||= []
    end
    
    def name
      names.first
    end
  end
end