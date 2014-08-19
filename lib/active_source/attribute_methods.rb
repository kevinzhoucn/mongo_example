module ActiveSource
  module AttributeMethods
    def method_missing(method_id, *args, &block)
      method_name = method_id.to_s
      if self.class.private_method_defined?(method_name)
        raise NoMethodError.new("Attempt to call private method", method_name, args)
      end

      if !self.class.generated_methods?
        self.class.define_attribute_methods
        if self.class.generated_methods.include?(method_name)
          return self.send(method_id, *args, $block)
        end
      end

      if self.class.primary_key.to_s == method_name
        id
      elsif md = self.class.match_attribute_method?(method_name)
        attribute_name, method_type = md.pre_match, md.to_s
        if @attributes.include?(attribute_name)
          __send__("attribute#{method_type}", attribute_name, *args, &block)
        else
          super
        end
      elsif @attributes.include?(method_name)
        read_attribute(method_name)
      else
        super
      end
    end

    def read_attribute(attr_name)
    end

    def write_attribute(attr_name, value)
    end

    def query_attribute(attr_name)
    end

    private
      def attribute?(attribute_name)
        query_attribute(attribute_name)
      end

      def attribute=(attribute_name, value)
        write_attribute(attribute_name, value)
      end
  end
end