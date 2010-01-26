module Gedspec
  class Individual
    include Gedspec::GedcomStackParser
    
    def names
      @names ||= []
    end
    
    def name
      names.first
    end
  end
end