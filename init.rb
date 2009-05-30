$:.unshift File.join(File.dirname(__FILE__), "lib")

require "core_extensions/file"
require "core_extensions/hash"

File.send :include, CoreExtensions::File
Hash.send :include, CoreExtensions::Hash
