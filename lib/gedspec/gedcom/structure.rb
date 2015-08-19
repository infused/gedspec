# TODO: split this class into Structure and SubStructure
module Gedspec
  module Gedcom
    class Structure
      include Gedspec::Gedcom::Extract

      def self.start_callbacks
        @start_callbacks ||= {}
      end

      def self.end_callbacks
        @end_callbacks ||= {}
      end

      def self.associations
        @associations ||= {}
      end

      def self.associations=(value)
        @associations = value
      end

      def self.attribute(context, name, options = {})
        attr_accessor name.to_sym

        params = default_options.merge!(options)
        self.associations = associations.merge(name => {context: context, options: params})
        start_callbacks[context] = [:update_attribute, params]
      end

      def self.default_options
        {attr: name.to_sym}
      end

      def initialize(*args)
        @gedcom_structure = args.first
        define_many_attributes
      end

      def to_gedcom
        @gedcom_structure
      end

      def xref
        @gedcom_structure[/0 (@.+?@)/, 1]
      end

      def id
        xref.gsub('@', '')
      end

      def get_level(structure)
        level = structure[/\d+/, 0]
        level && level.to_i
      end

      def update_attribute(data, params)
        data = params[:proc].call(data) if params[:proc]

        var = send(params[:attr])
        case params[:append]
        when :cont
          data = "#{var}\n#{data}" if var
        when :conc
          data = (var || '') + data
        end

        send("#{params[:attr]}=", data)
      end

      def define_many_attributes
        self.class.associations.each do |name, association|
          instance_variable_set "@#{name}", []

          options = association[:options]
          self.class.class_eval do
            define_method name.to_sym do
              extract_attribute association[:context], options[:top_level]
            end
          end
        end
      end

    end
  end
end
