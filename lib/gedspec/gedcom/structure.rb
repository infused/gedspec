module Gedspec
  module Gedcom
    class Structure
      include Gedspec::Gedcom::Extract
      
      cattr_accessor :start_callbacks
      @@start_callbacks = {}
      
      cattr_accessor :end_callbacks
      @@end_callbacks = {}
      
      def self.attr(context, attribute, options = {})
        attr_accessor attribute.to_sym
        
        if options[:alias]
          alias_method options[:alias].to_sym, attribute.to_sym
          alias_method "#{options[:alias]}=".to_sym, "#{attribute}".to_sym
        end
        
        params = {:attr => attribute.to_sym}
        @@start_callbacks[context] = [:update_attr, params.merge!(options)]
      end
      
      def self.parse(gedcom_content)
        parser = new(gedcom_content)
        parser.parse
        parser
      end
      
      def initialize(*args)
        @gedcom_structure = args.first
        define_many_attributes
      end
      
      def tag_handler(type, context, data)
        tag = context.join('/')
        callback, params = self.class.send("#{type}_callbacks")[tag]
        case callback
        when Symbol
          send(callback, data, params)
        when Proc, Method
          callback.call(data, params)
        end
      end
      
      def parse
        context_stack = []
        data_stack = []
        current_level = get_level(@gedcom_structure)
        @gedcom_structure.each do |line|
          level, tag, rest = line.strip.split(' ', 3)
          while level.to_i <= current_level
            tag_handler(:end, context_stack, data_stack.pop)
            context_stack.pop
            current_level -= 1
          end
        
          tag, rest = rest, tag if tag =~ /@.*@/
        
          context_stack << tag
          data_stack << rest
          current_level = level.to_i
        
          tag_handler(:start, context_stack, data_stack.last)
        end
      end
    
      def get_level(structure)
        level = structure[/\d+/, 0]
        level && level.to_i
      end
      
      def update_attr(data, params)
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
        attributes = []
        plural_attributes = []
        start_callbacks.each do |callback|
          options = callback[1][1]
          if options[:many]
            attributes << options[:attr]
            plural_attributes << options[:attr].to_s.pluralize
          end
        end
        
        attributes.uniq.each_with_index do |attribute, index|
          plural_attribute = plural_attributes[index]
          instance_variable_set "@#{attribute}", []
          
          self.class.class_eval do
            # def name
            define_method attribute.to_sym do
              instance_variable_get("@#{attribute}")[0]
            end
            
            # def names
            define_method plural_attribute.to_sym do
              instance_variable_get("@#{attribute}")
            end
            
            # def name=(value)
            define_method "#{attribute}=".to_sym do |value|
              array = instance_variable_get("@#{attribute}")
              array << value
              instance_variable_set("@#{attribute}", array)
            end
          end
        end
      end
      
    end
  end
end