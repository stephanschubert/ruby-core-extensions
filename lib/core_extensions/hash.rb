module CoreExtensions
  module Hash

    def pass(*keys)
      select{ |k,v| keys.include? k }
    end

    def block(*keys)
      reject{ |k,v| keys.include? k }
    end
    
  end
end
