module MetaProg
  module A
    autoload :B, 'meta_prog/b'
    # module B
    #   def greet
    #     'hello'
    #   end
    # end
    def self.greet
      'hello'
    end
  end
end