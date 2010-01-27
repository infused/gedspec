module Gedspec
  module Gedcom
    class StackParser
      
      def initialize(gedcom_structure = nil, *args)
        @start_callbacks  = {}
        @end_callbacks = {}
        @gedcom_structure = gedcom_structure
      end

      def tag_start(context, callback_method, params = nil)
        @start_callbacks[context.downcase] = [callback_method, params]
      end

      def tag_end(context, callback_method, params = nil)
        @end_callbacks[context.downcase] = [callback_method, params]
      end
    
      def tag_handler(type, context, data)
        tag = context.join('/').downcase
        callback, params = instance_variable_get("@#{type}_callbacks")[tag]
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
        level = structure.scan(/^\d+/)[0]
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
      # end
      
    end
  end
end