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
    has_many :sources, :source, 'Gedspec::Source', 'SOUR'
    has_many :notes, :note, 'Gedspec::Note', 'NOTE'
    has_many :objects, :object, 'Gedspec::MediaObject', 'OBJE'
  end
end
