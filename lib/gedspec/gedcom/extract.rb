module Gedspec
  module Gedcom
    module Extract
      def record_regex(tag, xref, level)
        if xref
          # For example: 0 @I1@ INDI
          /(^#{level} @#{xref}@ #{tag}.+?)^#{level}/m
        else
          /(^0 (?:@[^@]+@ |)#{tag}.+?)(?=^0)/m
        end
      end

      def extract(tag, xref = nil, level = 0)
        @file.rewind
        results = @file.read.force_encoding('ASCII-8BIT').scan(record_regex(tag, xref, level))
        results.size == 1 ? results.flatten[0] : results.flatten
      end

      def extract_attribute(tag, top_level = false)
        level = top_level ? @gedcom_structure.to_i : @gedcom_structure.to_i + 1
        results = @gedcom_structure.scan(/#{level} #{tag} (.*)/)
        results.size == 1 ? results.flatten[0] : results.flatten
      end
    end
  end
end
