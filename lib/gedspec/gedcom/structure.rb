# TODO split this class into Structure and SubStructure
module Gedspec
  module Gedcom
    class Structure
      include Gedspec::Gedcom::Extract

      cattr_accessor :start_callbacks
      @@start_callbacks = {}

      cattr_accessor :end_callbacks
      @@end_callbacks = {}

      class_attribute :associations
      self.associations = {}

      def self.attribute(context, name, options = {})
        attr_accessor name.to_sym

        params = {attr: name.to_sym}.merge!(options)
        self.associations = associations.merge({name => {context: context, options: params}})
        @@start_callbacks[context] = [:update_attribute, params]
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

      def get_level(structure)
        level = structure[/\d+/, 0]
        level && level.to_i
      end

      def update_attribute(data, params)
        data = params[:proc].call(data) if params[:proc]

        var = send(params[:attr])
        case params[:append]
        when :cont
          if var
            data = var + "\n" + data
          end
        when :conc
          data = (var || "") + data
        end

        send("#{params[:attr]}=", data)
      end

      def define_many_attributes
        associations.each_key do |name|
          association = associations[name]
          options = association[:options]

          instance_variable_set "@#{name}", []
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
