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
        xref ? /^#{level} @(#{xref})@ #{tag}/ : /^0 #{tag}/
      end
    
      def extract(tag, xref = nil, level = 0)
        record_start_regex = record_regex(tag, xref, level)
        level_regex = /^#{level}/
        
        snippet = []
        @file.each do |line|
          if line =~ record_start_regex || !snippet.empty? && line !~ level_regex
            snippet << line
          elsif !snippet.empty? && line =~ level_regex
            break
          end
        end
        snippet.join
      end
    
    end
  end
end