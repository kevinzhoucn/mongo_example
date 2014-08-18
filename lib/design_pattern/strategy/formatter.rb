module DesignPattern
  module Strategy
    # class Formatter
    #   def output_report( context )
    #     raise "Abstract method called"
    #   end
    # end
    module Formatter
      extend ActiveSupport::Concern

      module ClassMethods
        # def html_formatter
        #   result = "<h2>#{self.title}</h2>"
        #   self.text.each do |line|
        #     result += "<p>#{line}</p>"
        #   end
        #   result
        # end

        # def html_formatter(context)
        #   result = "<h2>#{context.title}</h2>"
        #   context.text.each do |line|
        #     result += "<p>#{line}</p>"
        #   end
        #   result
        # end

        # HTML_FORMATTER = lambda do |context|
        #   result = "<h2>#{context.title}</h2>"
        #   context.text.each do |line|
        #     result += "<p>#{line}</p>"
        #   end
        #   result
        # end
      end

      def test_method_02; "Test method"; end

      def html_formatter
        result = "<h2>#{self.title}</h2>"
        self.text.each do |line|
          result += "<p>#{line}</p>"
        end
        result
      end

      def plain_text_formatter
        result = "*****#{self.title}*****"
        self.text.each do |line|
          result += "#{line}  "
        end
        result
      end
    end
  end
end