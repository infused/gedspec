module Gedspec
  module Gedcom
    class File
      include Gedspec::Gedcom::Extract

      def initialize(filename)
        @file = ::File.open(filename, 'r')
      end

      def head
        extract 'HEAD'
      end

      def subm(xref = nil)
        extract 'SUBM', xref
      end

      def indi(xref = nil)
        extract 'INDI', xref
      end

      def fam(xref = nil)
        extract 'FAM', xref
      end

      def repo(xref = nil)
        extract 'REPO', xref
      end

      def sour(xref = nil)
        extract 'SOUR', xref
      end

      def note(xref = nil)
        extract 'NOTE', xref
      end

      def obje(xref = nil)
        extract 'OBJE', xref
      end
    end
  end
end
