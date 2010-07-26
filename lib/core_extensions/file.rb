module CoreExtensions
  module File

    ##
    # Replaces all occurrences of %pattern with %string.
    # Works per line currently. Returns true if there
    # were any replacements and false otherwise.
    #
    def replace(pattern, string)
      full_path = ::File.expand_path(path)

      unless ::File.file?(full_path)
        raise ArgumentError, "#{path} is not a file."
      end

      reopen(full_path, "r")
      lines = readlines

      changed = false
      lines.each { |line|
        changed = true if line.gsub!(pattern, string)
      }

      if changed
        reopen(full_path, "w")
        lines.each { |line| write(line) }
        close
      end

      changed
    end

  end
end
