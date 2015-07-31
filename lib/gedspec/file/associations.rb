module Gedspec
  class File
    module Associations
      def has_one(singular_name, class_name, tag)
        define_method singular_name do
          klass = class_name.constantize
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
          klass = class_name.constantize
          results = gedcom_file.send(tag.downcase.to_sym)

          if results.respond_to?(:map)
            results.map { |result| klass.new(result) }
          else
            klass.new(results)
          end
        end
      end

      def define_has_many_finder(singular_name, class_name, tag)
        define_method singular_name do |xref|
          klass = class_name.constantize
          tag_method = tag.downcase.to_sym
          klass.new gedcom_file.send(tag_method, xref)
        end
      end
    end
  end
end
