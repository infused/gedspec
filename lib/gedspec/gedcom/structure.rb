module Gedspec
  module Gedcom
    class Structure
      include Gedspec::Gedcom::Extract
      
      cattr_accessor :start_callbacks
      @@start_callbacks = {}
      
      cattr_accessor :end_callbacks
      @@end_callbacks = {}
      
      class_inheritable_accessor :associations
      self.associations = {}
      
      def self.attribute(context, name, options = {})
        attr_accessor name.to_sym
        
        params = {:attr => name.to_sym}.merge!(options)
        self.associations[name] = {:context => context, :options => params}
        @@start_callbacks[context] = [:update_attribute, params]
      end
      
      def self.parse(gedcom_content)
        new(gedcom_content).parse
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
        self
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
        attributes = []
        plural_attributes = []
        associations.each_key do |name|
          association = associations[name]
          options = association[:options]

          instance_variable_set "@#{name}", []
          self.class.class_eval do
            # def name
            define_method name.to_sym do
              instance_variable_get("@#{name}")[0]
            end
            
            # def name=(value)
            define_method "#{name}=".to_sym do |value|
              array = instance_variable_get("@#{name}")
              array << value
              instance_variable_set("@#{name}", array)
            end
            
            # def names
            if options[:many]
              define_method name.to_s.pluralize.to_sym do
                instance_variable_get("@#{name}")
              end
            end
          end
        end
      end
      
    end
  end
end