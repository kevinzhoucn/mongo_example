class Answer
  constructor: (text) ->
    @answerText = text
    @points = ko.observable(1)

class SurveyViewModel
  defPercent = [35, 22, 28, 15]
  constructor: (question, pointsBudget, answers) ->    
    @question = question
    @pointsBudget = pointsBudget
    @answers = (new Answer text for text in answers)
    @firstName = ko.observable("Bob")
    @lastName = ko.observable("Smith")
    @fullName01 = ko.computed =>
      @firstName() + " " + @lastName()
    @pointsUsed01 = ko.computed =>
      total = 0
      ( ( total += answer.points() ) for answer in @answers )
      total
    @pointsUsed = ko.computed =>
      total = 0
      ( ( total += answer.points() ) for answer in @answers )
      total
    @percentStocks = ko.computed =>
      tt = 1 - ( this.pointsUsed() / 10 )
      percent = 35 - tt * 35
      return percent.toFixed(1) + "%"
    @percentMM = ko.computed =>
      tt = 1 - ( this.pointsUsed() / 10 )
      percent = 22 - tt * 22
      return percent.toFixed(1) + "%"
    @percentCommodity = ko.computed =>
      tt = 1 - ( this.pointsUsed() / 10 )
      percent = 28 + tt * 22
      return percent.toFixed(1) + "%"
    @percentFixedIncome = ko.computed =>
      tt = 1 - ( this.pointsUsed() / 10 )
      percent = 15 + tt * 35
      return percent.toFixed(1) + "%"

$ ->
  answers = [
     "Functionality, compatibility, pricing - all that boring stuff",
     "How often it is mentioned on Hacker News",    
     "Number of gradients/dropshadows on project homepage",        
     "Totally believable testimonials on project homepage"
  ]
  ko.applyBindings(new SurveyViewModel("Which factors affect your technology choices?", 10, answers))