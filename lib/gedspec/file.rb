module Gedspec
  class File
    attr_accessor :gedcom_file

    def initialize(filename)
      @gedcom_file = Gedcom::File.new(filename)
    end

    def header
      Header.new gedcom_file.extract('HEAD')
    end
  end
end
