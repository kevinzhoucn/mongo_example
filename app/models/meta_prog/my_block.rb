module MetaProg
  class MyBlock
    @output = []
    def initialize
      @output = []
    end
    def a_method(a, b)
       return a + yield(a, b) if block_given?
       a + b
    end

    def b_method
      return yield if block_given?
      'no block'
    end

    def my_method(&the_proc)
      the_proc
    end

    def my_method_02(greeting)
      "#{greeting}, #{yield}!"
    end

    def self.my_event(name)
      @output << "ALERT: #{name}" if yield
    end

    def load_script
      Dir.glob('public/test_script/*.rb').each { |file| load file}
    end
  end

  my_var = "Success"

  MyClass = Class.new do 
    @my_var = "#{my_var} in the class definition!"
    define_method :my_method do
      @my_var_02 = "#{my_var} in the method!"
    end

    class << self
      attr_accessor :now
      # define_method :now do
      #   "In the method now"
      # end
    end
  end

  class MyInsClass
    def initialize
      @v = 1
    end
  end

  class RedFlag
    def initialize
      @output = []
    #   @setups = []
    #   @events = []
    end
    setups = []
    events = {}
    # @output = ["0"]

    self.send :define_method, :event do |name, &block|
      events[name] = block
    end

    self.send :define_method, :setup do |&block|
      setups << block
    end

    self.send :define_method, :each_event do |&block|
      events.each_pair do |name, event|
        block.call name, event
      end
    end

    self.send :define_method, :each_setup do |&block|
      setups.each do |event|
        block.call event
      end
    end

    self.send :define_method, :i_load_file do
      Dir.glob('public/test_script/*.rb').each do |file|
        load file
        each_event do |name, event|
          env = Object.new
          each_setup do |setup|
            env.instance_eval &setup
          end
          @output << "ALERT: #{name}" if env.instance_eval &event
        end
      end
    end
  end
end