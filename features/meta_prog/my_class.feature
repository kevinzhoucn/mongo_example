Feature: Class Book Loan
  Loan book create loan time

    Scenario: Loan To String
      Given Book name "War and Peace"
        And Loaned Time "Mon Apr 06 12:15:50"
      Then Loan information should be same as "WAR AND PEACE loaned on Mon Apr 06 12:15:50"