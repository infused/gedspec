module Gedspec
  class Individual
    def names
      @names ||= []
    end
    
    def name
      names.first
    end
    
  end
end