module Gedspec
  class File
    module Associations
      def has_one(singular_name, class_name, tag)
        define_method singular_name do
          klass = class_name.constantize
          klass.new gedcom_file.extract(tag)
        end
      end

      def has_many(plural_name, singular_name, class_name, tag)
        define_method plural_name do
          klass = class_name.constantize
          tag_method = tag.downcase.to_sym
          results = gedcom_file.send(tag_method)

          if results.is_a?(Array)
            results.map { |r| klass.new r }
          else
            klass.new results
          end
        end

        define_method singular_name do |xref|
          klass = class_name.constantize
          tag_method = tag.downcase.to_sym
          klass.new gedcom_file.send(tag_method, xref)
        end
      end
    end
  end
end
