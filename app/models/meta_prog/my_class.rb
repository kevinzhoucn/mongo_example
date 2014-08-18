# class Class
#   def attr_checked(attribute, &validation)
#     define_method "#{attribute}=" do |value|
#       raise 'Invalid attribute' unless ( value and validation.call(value) )
#       instance_variable_set("@#{attribute}", value)
#     end

#     define_method attribute do
#       instance_variable_get("@#{attribute}")
#     end
#   end
# end

module CheckedAttributes
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def attr_checked(attribute, &validation)
      define_method "#{attribute}=" do |value|
        raise 'Invalid attribute' unless ( value and validation.call(value) )
        instance_variable_set("@#{attribute}", value)
      end

      define_method attribute do
        instance_variable_get("@#{attribute}")
      end
    end
  end
end

module MyModule
  def my_method; 'hello'; end

# eval code
  # def self.add_checked_attribute(clazz, attribute)
  #   eval "
  #     class #{clazz}
  #       def #{attribute}=(value)
  #         raise 'Invalid attribute' unless value
  #         @#{attribute} = value
  #       end

  #       def #{attribute}()
  #         @#{attribute}
  #       end
  #     end
  #   "
  # end

# class eval code
  def self.add_checked_attribute(clazz, attribute, &validation)
    clazz.class_eval do
      define_method "#{attribute}=" do |value|
        raise 'Invalid attribute' unless ( value and validation.call(value) )
        instance_variable_set("@#{attribute}", value)
      end

      define_method attribute do
        instance_variable_get("@#{attribute}")
      end
    end
  end
end

# module MetaProg
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
    attr_reader :title
    def initialize(title)
      @title = title
    end

    def title1; 'title'; end
    def subtitle; 'subtitle'; end
    def lend_to(*args); "Lending to #{args}"; end

    def self.deprecate(old_method, new_method)
      define_method(old_method) do | *args, &block |
        warn "Warning: #{old_method}() is deprecated, Use #{new_method}."
        send(new_method, *args, &block)
      end
    end

    deprecate :GetTitle, :title1
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

  class MyModuleClass02
    extend MyModule
  end

  class MyAliaClass
    def my_method; 'my_method()'; end
    alias :m :my_method
  end

  class MyAroundAlias
    def review_of(book); "Get review of Book: #{book.title}"; end

    alias :old_review_of :review_of

    def review_of(book)
      # start = Time.now
      result = old_review_of book
      # time_taken = Time.now - start
      result += " from new review of."
    end
  end

  class Person
    include CheckedAttributes

    attr_accessor :age
    attr_checked :age do |v|
      v >= 18
    end
  end
end