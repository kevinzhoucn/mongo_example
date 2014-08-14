module ActiveSource
  module Validations
    extend ActiveSupport::Concern
    include do
      alias_method_chain :save, :validation
    end

    module ClassMethods
      def validates_each; 'Validates each!'; end
    end

    def save_with_validation; 'Save with validation!'; end
  end
end