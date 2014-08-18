module EikonDev
  class FrontController < AppeikonController
    def index
      @data ||= []
      @data << "Eikon Dev"
    end
  end
end