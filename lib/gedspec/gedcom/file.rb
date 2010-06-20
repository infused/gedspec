module Gedspec
  module Gedcom
    class File
      def initialize(filename)
        @file = ::File.open(filename, 'r')
      end
    
      def head
        extract 'HEAD'
      end
    
      def subm(xref)
        extract 'SUBM', xref
      end
    
      def indi(xref)
        extract 'INDI', xref
      end
    
      def fam(xref)
        extract 'FAM', xref
      end
    
      def repo(xref)
        extract 'REPO', xref
      end
    
      def sour(xref)
        extract 'SOUR', xref
      end
    
      def note(xref)
        extract 'NOTE', xref
      end
    
      def obje(xref)
        extract 'OBJE', xref
      end
      
      def record_regex(tag, xref, level)
        xref ? /(^#{level} @#{xref}@ #{tag}.+?)^#{level}/m : /(^0 #{tag}.+?)^0/m
      end
    
      def extract(tag, xref = nil, level = 0)
        results = @file.read.scan(record_regex(tag, xref, level))
        results.size == 1 ? results.flatten[0] : results
      end
    
    end
  end
end