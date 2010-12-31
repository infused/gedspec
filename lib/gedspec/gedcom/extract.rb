module Gedspec
  module Gedcom
    module Extract
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