module DesignPattern
  module Strategy
    class StrategyBase
    end

    StrategyBase.class_eval do
      include Formatter
    end
  end
end