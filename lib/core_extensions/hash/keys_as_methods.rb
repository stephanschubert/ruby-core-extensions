module CoreExtensions
  module Hash
    module KeysAsMethods

      # Access a key by calling a method with
      # the same name. Works for :name and "name".
      #
      def method_missing(name)
        self[name.to_s] || self[name.to_sym]
      end
      
    end
  end
end
