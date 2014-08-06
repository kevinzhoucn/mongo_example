module MetaProg
  class MyClass
    class << self
      attr_accessor :bar
    end

    def method_one
      def method_two; 'Method Two!'; end
      'Method One!'
    end

    @my_var = 1
    def self.read; @my_var; end
    def self.write; @my_var = 3; end
    def write; @my_var = 2; end
    def read; @my_var; end
  end

  class Loan
    def initialize(book)
      @book = book
      @time = Loan.time_class.now
    end

    def self.time_class
      @time_class || Time
    end

    def to_s
      "#{@book.upcase} loaned on #{@time}"
    end
  end

  class Book
    def title; 'title'; end
    def subtitle; 'subtitle'; end
    def lend_to(*args); "Lending to #{args}"; end

    def self.deprecate(old_method, new_method)
      define_method(old_method) do | *args, &block |
        warn "Warning: #{old_method}() is deprecated, Use #{new_method}."
        send(new_method, *args, &block)
      end
    end

    deprecate :GetTitle, :title
    deprecate :LEND_TO_USER, :lend_to
    deprecate :title2, :subtitle
  end

  class BlankClass
    instance_methods.each do |m|
      undef_method m unless m.to_s =~ /^__(send|id)__|(.*)eval|(.*)class|singleton*|method_missing|respond_to?/
    end
  end

  class MyModuleClass
    class << self
      include MyModule
    end
  end
end

module MyModule
  def my_method; 'hello'; end
end