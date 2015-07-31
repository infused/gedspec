module Gedspec
  class File
    attr_accessor :gedcom_file

    def initialize(filename)
      @gedcom_file = Gedcom::File.new(filename)
    end

    def header
      Header.new gedcom_file.extract('HEAD')
    end

    def individuals
      gedcom_file.indi.map { |s| Individual.new s }
    end

    def individual(xref)
      Individual.new gedcom_file.indi(xref)
    end

    def families
      gedcom_file.fam.map { |s| Family.new s }
    end

    def family(xref)
      Family.new gedcom_file.fam('F5')
    end
  end
end
