module MetaProg
  class Computer
    def initialize(computer_id, data_source)
      @id = computer_id
      @data_source = data_source
      data_source.methods.grep(/^get_(.*)_price$/) { Computer.define_component $1 }
    end

    def self.define_component(name)
      define_method(name) {
        price = @data_source.send "get_#{name}_price"
        result = "#{name.to_s.capitalize}: ($#{price})"
        return " * #{result}" if price >= 100
        result
      }
    end

    # define_component :mouse
    # define_component :cpu
    # define_component :keyboard
    # define_component :display

    # def mouse
    #   component :mouse
    # end

    # def cpu
    #   component :cpu
    # end

    # def keyboard
    #   component :keyboard
    # end

    # def display
    #   component :display
    # end

    # def component(name)
    #   price = @data_source.send "get_#{name}_price"
    #   result = "#{name.to_s.capitalize}: ($#{price})"
    #   return " * #{result}" if price >= 100
    #   result
    # end

    # def mouse
    #   price = @data_source.get_mouse_price
    #   result = "Mouse: ($#{price})"
    #   return " * #{result}" if price >= 100
    #   result
    # end

    # def cpu
    #   price = @data_source.get_cpu_price
    #   result = "Cpu: ($#{price})"
    #   return " * #{result}" if price >= 100
    #   result
    # end

    # def keyboard
    #   price = @data_source.get_keyboard_price
    #   result = "Keyboard: ($#{price})"
    #   return " * #{result}" if price >= 100
    #   result
    # end

    # def display
    #   price = @data_source.get_display_price
    #   result = "Display: ($#{price})"
    #   return " * #{result}" if price >= 100
    #   result
    # end
  end
end