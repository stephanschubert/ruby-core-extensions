module CoreExtensions
  module Hash

    # >> { :a => 1, :b => 2 }.pass(:a)
    # => { :a => 1 }
    #
    # >> { :abc => 1, :bbc => 2 }.pass(/^ab/)
    # => { :abc => 1 }
    #
    def pass(*keys)
      if keys.first.is_a?(Regexp)
        reject { |k,v| k !~ keys.first }
      else
        reject { |k,v| !keys.include?(k) }
      end
    end

    # >> { :a => 1, :b => 2 }.block(:a)
    # => { :b => 2 }
    #
    # >> { :abc => 1, :bbc => 2 }.block(/^ab/)
    # => { :bbc => 2 }
    #
    def block(*keys)
      if keys.first.is_a?(Regexp)
        reject { |k,v| k =~ keys.first }
      else
        reject { |k,v| keys.include? k }
      end
    end

    # >> { :a => 1, :b => 2, :c => 3 }.pick(:a, :c)
    # => [ 1, 3 ]
    #
    def pick(*keys)
      return *keys.map { |k| self[k] } if keys.size > 1
      self[keys.first]
    end

    # Same return value as #pick but deletes the
    # the keys from the hash also.
    #
    def pluck(*keys)
      return *keys.map { |k| delete(k) } if keys.size > 1
      delete(keys.first)
    end

  end
end
