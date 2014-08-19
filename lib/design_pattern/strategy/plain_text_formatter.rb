module DesignPattern
  module Strategy
    class PlainTextFormatter #< Formatter
      def output_report( context  )
        result = "*****#{context.title}*****"
        context.text.each do |line|
          result += "#{line}  "
        end
        result
      end
    end

    PLAIN_TEXT_FORMATTER = lambda do |context|
      result = "*****#{context.title}*****"
      context.text.each do |line|
        result += "#{line}  "
      end
      result
    end
  end
end