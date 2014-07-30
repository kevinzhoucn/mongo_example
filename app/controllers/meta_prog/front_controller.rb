class MetaProg::FrontController < ApplicationController
  def index
    require 'meta_prog/my_module'
    require 'meta_prog/data_source'
    @data = []
    @data << MyModule::MyConstant

    my_class = MyModule::MyClass.new
    @data << MyModule::MyClass::MyConstant
    @data << my_class.class
    @data << my_class.class.superclass
    @data << MyModule::MyClass.ancestors
    @data << my_class
    @data << my_class.testing_self
    @data << my_class.my_method_02

    data_source = MetaProg::DataSource.new
    @data << data_source.methods.grep(/^get_(.*)_price$/)

    computer = MetaProg::Computer.new(0, data_source)

    @data << computer.cpu
    @data << computer.mouse
    @data << computer.keyboard
    @data << computer.display


  end

  def block
    @data = []

    # start from block function
    my_block = MetaProg::MyBlock.new
    @data << my_block.a_method(1, 2)
    @data << "Block: " + my_block.a_method(1, 2) {
        |x, y| (x + y) * 3
    }.to_s

    @data << my_block.b_method
    @data << my_block.b_method { "here's a block!" }

    flat_scope = MetaProg::MyClass.new
    @data << flat_scope.my_method

    flat_scope_02 = MetaProg::MyInsClass.new
    @data << flat_scope_02.instance_eval { @v }
  end
end
