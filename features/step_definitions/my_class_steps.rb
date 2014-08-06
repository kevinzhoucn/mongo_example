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
end

Given /^Loaned Time "(.*)"$/ do |loan_time|
  FakeTime.now = loan_time

  MetaProg::Loan.instance_eval { @time_class = FakeTime }
  @loan = MetaProg::Loan.new(@name)
end

Then /^Loan information should be same as "(.*)"$/ do |string|
  @loan.to_s.should == string
  # (@name + " loaded on " + @my_time).should == string
  # a = (@name + " loaned on " + @my_time)
  # b = string
  # assert_equal(a, b)
end