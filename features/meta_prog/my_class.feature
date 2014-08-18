Feature: Class Book Loan
  Loan book create loan time

    Scenario: Loan To String
      Given Book name "War and Peace"
        And Loaned Time "Mon Apr 06 12:15:50"
      Then Loan information should be same as "WAR AND PEACE loaned on Mon Apr 06 12:15:50"

    Scenario: Module Extend
      Given New Classes with extend Module
      Then Classes should have Module method

    Scenario: Class Method Aliases
      Given A class MyAliaClass with Method Alias :m to :my_method
      Then MyAliaClass method return same value :m with :my_method

    Scenario: Class Around Aliases
      Given Book name "War and Peace"
      Then Get reviews of book return new reviews result with string append

    Scenario: Check Attributes Age Valid Methods
      Given There is person
      When Assign valid age "18" to this person
      Then Person accept the valid age "18"

    Scenario: Check Attributes Age Invalid Methods
      Given There is person
      When Assign invalid age "nil" or "false" to this person
      Then Person not accept the invalid age "nil", raise exceptation
      Then Person not accept the invalid age "false", raise exceptation

    @age_less_than_18
    Scenario: Check Attributes Age Invalid < 18 Exception
      Given There is person
      Then Person not accept the invalid age "17", raise exceptation