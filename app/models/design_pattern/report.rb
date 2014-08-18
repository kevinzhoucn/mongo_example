module DesignPattern
  class Report
    attr_reader :title, :text
    attr_accessor :formatter

    def initialize(formatter)
      @title = 'Monthly Report'
      @text = ['Things are going', 'really, really well.']
      @formatter = formatter
    end

    def output_report
      @formatter.output_report(self)
    end
  end

  class Report02
    attr_reader :title, :text
    attr_accessor :formatter

    def initialize(&formatter)
      @title = 'Monthly Report'
      @text = ['Things are going', 'really, really well.']
      @formatter = formatter
    end

    def output_report
      @formatter.call(self)
    end
  end

  class Report03 < Strategy::StrategyBase
    attr_reader :title, :text
    attr_accessor :formatter

    def initialize
      @title = 'Monthly Report'
      @text = ['Things are going', 'really, really well.']
      # @formatter = formatter
    end

    def output_report(&formatter)
      formatter.call(self)
    end
  end

  class Report04
    include Strategy::Formatter
    
    attr_reader :title, :text
    attr_accessor :formatter

    def initialize
      @title = 'Monthly Report'
      @text = ['Things are going', 'really, really well.']
      # @formatter = formatter
    end

    def output_report(&formatter)
      formatter.call(self)
    end
  end

  # class Report
  #   def initialize
  #     @title = 'Monthly Report'
  #     @text = ['Things are going', 'really, really well.']
  #   end

  #   def output_head
  #     @result = "<h2>#{@title}</h2>"
  #   end

  #   def output_body_start
  #   end

  #   def output_body
  #     @text.each do |line|
  #       output_line(line)
  #     end
  #   end

  #   def output_body_end
  #   end

  #   def output_line(line)
  #     @result = "<p>#{line}</p>"
  #   end

  #   def output_report
  #     output_head
  #     output_body_start
  #     output_body
  #     output_body_end
  #     @result
  #   end
  # end
end