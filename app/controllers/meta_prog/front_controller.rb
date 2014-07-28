class MetaProg::FrontController < ApplicationController
  def index
    require 'meta_prog/my_module'
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
  end
end
