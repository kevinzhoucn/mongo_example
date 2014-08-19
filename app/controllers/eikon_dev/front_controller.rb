module EikonDev
  class FrontController < AppeikonController
    def index
      @data ||= []
      @data << "Eikon Dev"
    end

    def getstart
      
    end
  end
end