module Gedspec
  class Individual
    def initialize(gedcom_record)
      @gedcom_record = gedcom_record
    end
    
    def names
      @names ||= []
    end
    
    def name
      names.first
    end
    
  end
end