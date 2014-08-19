module DesignPattern
  module Strategy
    class HTMLFormatter #< Formatter
      def output_report( context )
        result = "<h2>#{context.title}</h2>"
        context.text.each do |line|
          result += "<p>#{line}</p>"
        end
        result
      end
    end

    HTML_FORMATTER = lambda do |context|
      result = "<h2>#{context.title}</h2>"
      context.text.each do |line|
        result += "<p>#{line}</p>"
      end
      result
    end

    HTML_FORMATTER_02 = lambda do |context|
      result = "<h2>!!This is test #{context.title}!!</h2>"
      context.text.each do |line|
        result += "<p>#{line}</p>"
      end
      result
    end

    HTML_TEST = "Test"
  end
end