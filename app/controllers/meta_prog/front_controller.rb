class MetaProg::FrontController < ApplicationController
    include MetaProg

# get 'meta/front' index action
  def index
    require 'meta_prog/my_module'
    require 'meta_prog/data_source'
    @data = []
    @data << MyModule::MyConstant    

    # Initialize class
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
# end index action

# get 'meta/block' block action
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
    @data << MetaProg::MyClass.now = "Mon Apr 06 12:15:50"
    @data << MetaProg::MyClass.now

    flat_scope_02 = MetaProg::MyInsClass.new
    @data << flat_scope_02.instance_eval { "instance_eval in @v: #{@v}" }

    inc = Proc.new { |x| x + 1 }
    @data << "In prox new method: #{inc.call(2)}"

    @data << p = my_block.my_method {|name| "Hello, #{name}"}
    @data << p.call("Bill")

    my_proc = proc { "Mick" }
    @data << my_block.my_method_02("hello", &my_proc)
    @data << my_block.my_method_02("hello") {"Albert"}

    @data << Dir.glob('public/test_script/*.rb')

    #my_block.load_script
    @data << MetaProg::MyBlock.instance_eval { @output }

    i_redflag = MetaProg::RedFlag.new
    i_redflag.i_load_file
    @data << i_redflag.instance_eval { @output }
  end
# end block action

# get 'meta/iclass' iclass action
  def iclass
    @data = []
    #start from class section
    my_class = MyClass.new
    @data << my_class.method_one
    @data << my_class.method_two

    # @data << MetaProg::MyClass.bar = 2
    # @data << MetaProg::MyClass.bar

    @data << my_class.write
    @data << my_class.read
    @data << MyClass.read
    @data << MyClass.write
    @data << MyClass.read

    my_class_02 = MyClass.new
    @data << my_class_02.read

    my_loan = Loan.new("War and Peace")
    @data << my_loan.to_s
    
    my_book = Book.new("War and Peace")
    @data << my_book.LEND_TO_USER("Bill", "Mac")

    # my singleton method
    obj = BlankClass.new
    eigenclass = class << obj
        self
    end
    @data << eigenclass.instance_methods

    obj.class_eval do
        class << obj
            def my_singleton_method; "my_singleton_method"; end
        end
    end

    @data << obj.my_singleton_method
    @data << eigenclass.instance_methods

    my_class_03 = MyModuleClass.new
    @data << MyModuleClass.my_method
    @data << MyModuleClass02.my_method
  end
# end iclass action

# get 'meta/isource' isource action
    def isource
        @data = []

        @data << MetaProg::A::B.greet
        isource = MetaSource.new
        @data << isource

        duck = Duck.new
        @data << Duck.find
        @data << duck.id

        @data << Duck.validates_each
        @data << duck.save_with_validation

        # @data << Duck.instance_methods
        # @data << Duck.methods
        # @data << duck.methods

        @data << duck.class.methods
        @data << duck.class.public_class_method
        @data << Duck.class.private_methods
        @data << duck.class.class_variables
    end
end