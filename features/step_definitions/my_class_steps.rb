include MetaProg
# class FakeTime
# end

FakeTime = Class.new do
  class << self
    attr_accessor :now
    # define_method :now do
    #   "Mon Apr 06 12:15:50"
    # end
    #def now; loan_time; end
  end
end

# FakeTime = Class.new do |loan_time|
#   class << self
#     define_method :now do
#       loan_time
#     end
#   end
# end
# FakeTime.class_eval do
#   def self.now; "Mon Apr 06 12:15:50"; end
# end

### Given ###
Given /^Book name "(.*)"$/ do |name|
  @name = name.upcase
  # @book = Book.new(name)
  # @book = Factory(:user)
  # @book = FactoryGirl.create(:book)
  @book = FactoryGirl.build(:book)
end

Given /^Loaned Time "(.*)"$/ do |loan_time|
  FakeTime.now = loan_time

  Loan.instance_eval { @time_class = FakeTime }
  @loan = Loan.new(@name)
end

Given /^New Classes with extend Module$/ do
  @my_module_class_01 = MyModuleClass.new
  @my_module_class_02 = MyModuleClass02.new
  @obj = Object.new
  @obj.extend MyModule
end

Given /^A class MyAliaClass with Method Alias :m to :my_method$/ do 
  @alia_class = MyAliaClass.new
end

Then /^Loan information should be same as "(.*)"$/ do |string|
  @loan.to_s.should == string
  # (@name + " loaded on " + @my_time).should == string
  # a = (@name + " loaned on " + @my_time)
  # b = string
  # assert_equal(a, b)
end

Then /^Classes should have Module method$/ do
  MyModuleClass.my_method.should == 'hello'
  MyModuleClass02.my_method.should == 'hello'

  @obj.my_method.should == 'hello'
end

Then /^MyAliaClass method return same value :m with :my_method$/ do
  @alia_class.my_method.should == @alia_class.m
end

Then /^Get reviews of book return new reviews result with string append$/ do
  around_alias = MyAroundAlias.new
  around_alias.review_of(@book).should == "Get review of Book: #{@book.title} from new review of."
end


Given(/^There is person$/) do
  # MyModule.add_checked_attribute(Person, :age) { |v| v >= 18 }
  @bob = Person.new
end

When(/^Assign valid age "(\d+)" to this person$/) do |age|
  @bob.age = age.to_i
end

Then(/^Person accept the valid age "(\d+)"$/) do |expected_age|
  assert_equal expected_age.to_i, @bob.age
end

When(/^Assign invalid age "(.*?)" or "(.*?)" to this person$/) do |age1, age2|
  @age_invalid_01 = age1
  @age_invalid_02 = age2
end

Then(/^Person not accept the invalid age "(.*?)", raise exceptation$/) do |age_invalid|  
  # assert_raises RuntimeError, 'Invalid attribute' do |age01_invalid|
  #   @bob.age = age01_invalid
  # end
  if age_invalid == 'nil' or age_invalid == 'false'
    age_invalid = nil
  else
    age_invalid = age_invalid.to_i
  end
  assert_raise RuntimeError, 'Invalid attribute' do
    @bob.age = age_invalid
  end
end