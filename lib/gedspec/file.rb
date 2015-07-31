module Gedspec
  class File
    extend Associations
    attr_accessor :gedcom_file

    def initialize(filename)
      @gedcom_file = Gedcom::File.new(filename)
    end

    has_one :header, 'Gedspec::Header', 'HEAD'
    has_many :individuals, :individual, 'Gedspec::Individual', 'INDI'
    has_many :families, :family, 'Gedspec::Family', 'FAM'
    has_many :repositories, :repository, 'Gedspec::Repository', 'REPO'
  end
end
