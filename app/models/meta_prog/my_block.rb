module MetaProg
  class MyBlock
    def a_method(a, b)
       return a + yield(a, b) if block_given?
       a + b
    end

    def b_method
      return yield if block_given?
      'no block'
    end
  end

  my_var = "Success"

  MyClass = Class.new do 
    @my_var = "#{my_var} in the class definition!"
    define_method :my_method do
      @my_var_02 = "#{my_var} in the method!"
    end
  end

  class MyInsClass
    def initialize
      @v = 1
    end
  end
end