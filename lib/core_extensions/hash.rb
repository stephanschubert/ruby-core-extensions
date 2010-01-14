module CoreExtensions
  module Hash

    # >> { :a => 1, :b => 2 }.pass(:a)
    # => { :a => 1 }
    def pass(*keys)
      select{ |k,v| keys.include? k }
    end

    # >> { :a => 1, :b => 2 }.block(:a)
    # => { :b => 2 }
    def block(*keys)
      reject{ |k,v| keys.include? k }
    end

    # >> { :a => 1, :b => 2, :c => 3 }.pick(:a, :c)
    # => [ 1, 3 ]
    def pick(*keys)
      keys.map { |k| self[k] }
    end

    # Same return value as #pick but deletes the
    # the keys from the hash also.
    def pluck(*keys)
      keys.map { |k| delete(k) }
    end
    
  end
end
