module Gedspec
  module Gedcom
    class File
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
      
      def record_regex(tag, xref, level)
        xref ? /(^#{level} @#{xref}@ #{tag}.+?)^#{level}/m : /(^0 (?:@[^@]+@ |)#{tag}.+?)(?=^0)/m
      end
    
      def extract(tag, xref = nil, level = 0)
        @file.rewind
        results = @file.read.scan(record_regex(tag, xref, level))
        results.size == 1 ? results.flatten[0] : results.flatten
      end
    
    end
  end
end