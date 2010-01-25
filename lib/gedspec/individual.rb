module Gedspec
  class Individual < GedcomSection
    def initialize(gedcom_record)
      super
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