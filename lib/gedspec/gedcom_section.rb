module Gedspec
  class GedcomSection
    def initialize(*args)
      @start_callbacks  = {}
      @end_callbacks = {}
    end

    def tag_start(context, callback_method, params = nil)
      @start_callbacks[context.downcase] = [callback_method, params]
    end

    def tag_end(context, callback_method, params = nil)
      @end_callbacks[context.downcase] = [callback_method, params]
    end
    
    def call_handler(callback_type, context, data)
      callback, params = instance_variable_get("@#{callback_type}_callbacks")[context.join('/').downcase]
      case callback
      when Symbol
        send(callback, data, params)
      when Proc, Method
        callback.call(data, params)
      end
    end
    
    def parse(structure)
      context_stack = []
      data_stack = []
      current_level = -1
      structure.each do |line|
        level, tag, rest = line.chop.split(' ', 3)
        while level.to_i <= current_level
          call_handler(:end, context_stack, data_stack.pop)
          context_stack.pop
          current_level -= 1
        end

        tag, rest = rest, tag if tag =~ /@.*@/
        context_stack << tag
        data_stack << rest
        current_level = level.to_i

        call_handler(:start, context_stack, data_stack.last)
      end
    end
  end
end