module Gedspec
  module Gedcom
    class StackParser
      
      cattr_accessor :start_callbacks
      @@start_callbacks = {}
      
      cattr_accessor :end_callbacks
      @@end_callbacks = {}
      
      def self.ged_attr(context, attribute, options = {})
        attr_accessor attribute.to_sym
        @@start_callbacks[context.downcase] = [:update_attr, {:attr => "@#{attribute}".to_sym}]
      end
      
      def self.parse(gedcom_content)
        parser = new(gedcom_content)
        parser.parse
        parser
      end
      
      def initialize(*args)
        @gedcom_structure = args.first
      end
      
      def tag_handler(type, context, data)
        tag = context.join('/').downcase
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
        
        var = instance_variable_get(params[:attr])
        case params[:append]
        when :cont
          if var
            data = var + "\n" + data
          end
        when :conc
          data = (var || "") + data
        end
        instance_variable_set(params[:attr], data)
      end
      
    end
  end
end