module CoreExtensions
  module Hash
    module KeysAsMethods

      # Access a key by calling a method with
      # the same name. Works for :name and "name".
      #
      # { :a => "b" }.a # => "b"
      # { "a" => :b }.a # => :b
      #
      # Asking for the boolean value of an key
      # will return true or false depending whether
      # the value is actually true, "true", 1 or "1".
      #
      # { :online => "1" }.online? # => true
      # { :online => "2" }.online? # => false
      #
      # Other method calls w/ arguments and/or block
      # will still work as expected.
      #
      def method_missing(name, *args, &block)
        super if args.size > 0 or block_given?

        if name.to_s =~ /\A(.+)\?\Z/
          key = $1
          val = indifferent_get(key)
          %w(true 1).include?(val.to_s)
        else
          indifferent_get(name)
        end
      end

      private

      def indifferent_get(name)
        self[name.to_s] || self[name.to_sym]        
      end
      
    end
  end
end
