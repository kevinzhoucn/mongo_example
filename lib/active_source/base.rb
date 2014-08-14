module ActiveSource
  class Base
    class << self
      def find; 'Find method'; end
      def frist; 'First method'; end
      def last; 'Last method'; end
    end

    public
      def id; 'ID'; end
      def save; 'Save'; end
  end


  Base.class_eval do
    include Validations
  end
end