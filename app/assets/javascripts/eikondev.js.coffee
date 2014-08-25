#Answer =(text) ->
#  @answerText = text
#  @points = ko.observable(1)

class Answer
  constructor: (text) ->
    @answerText = text
    @points = ko.observable(1)

class SurveyViewModel
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

  fullName: ->
    @firstName() + " " + @lastName()

#  pointsUsed: ko.computed ->
#    total = 0
#    ( ( total += answer.points() ) for answer in @answers )
#    total
#  , this

  pointsUsed: ->
    total = 0
    ( ( total += answer.points() ) for answer in @answers )
    total

#  fullName: ko.computed ->
#    return @firstName + " " + @lastName
#  , this
  
#  pointsUsed: ko.computed => 
#    ( answer.points() for answer in @answers )
#      total += answer.points()

    #@pointsUsed = ko.computedb ->
    #  for answer in @answers
    #    total += answer.points()

#SurveyViewModel =(question, pointsBudget, answers01) ->
#  @question = question
#  @pointsBudget = pointsBudget
#  @answers = (new Answer text for text in answers01)

$ ->
  answers = [
     "Functionality, compatibility, pricing - all that boring stuff",
     "How often it is mentioned on Hacker News",    
     "Number of gradients/dropshadows on project homepage",        
     "Totally believable testimonials on project homepage"
  ]
  answers01 = [1, 2, 3, 4, 5]
  ko.applyBindings(new SurveyViewModel("Which factors affect your technology choices?", 10, answers))