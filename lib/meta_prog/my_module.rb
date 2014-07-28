module MyModule
  MyConstant = 'Outer constant'

  class MyClass
    MyConstant = 'Inner constant 02'
    def my_method; 'my_method()'; end

    def testing_self
      @var = 10
      my_method_02()
      # self
    end

    def my_method_02
      @var = @var + 1
    end
  end
end