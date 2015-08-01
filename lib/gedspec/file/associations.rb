module Gedspec
  class File
    module Associations
      def has_one(singular_name, class_name, tag)
        define_method singular_name do
          klass = Gedspec.const_get(class_name)
          klass.new(gedcom_file.extract tag)
        end
      end

      def has_many(plural_name, singular_name, class_name, tag)
        define_has_many_collection(plural_name, class_name, tag)
        define_has_many_finder(singular_name, class_name, tag)
      end

      private

      def define_has_many_collection(plural_name, class_name, tag)
        define_method plural_name do
          klass = Gedspec.const_get(class_name)
          results = gedcom_file.send(tag.downcase.to_sym)
          results.map { |result| klass.new(result) }
        end
      end

      def define_has_many_finder(singular_name, class_name, tag)
        define_method singular_name do |xref|
          klass = Gedspec.const_get(class_name)
          tag_method = tag.downcase.to_sym
          result = gedcom_file.send(tag_method, xref)
          result.empty? ? nil : klass.new(result)
        end
      end
    end
  end
end
