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
          gedcom_file.send(tag_method).map { |s| klass.new s }
        end

        define_method singular_name do |xref|
          klass = class_name.constantize
          tag_method = tag.downcase.to_sym
          klass.new gedcom_file.indi(xref)
        end
      end
    end
  end
end
