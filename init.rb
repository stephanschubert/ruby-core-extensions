$:.unshift File.join(File.dirname(__FILE__), "lib")

require "core_extensions/hash"

Hash.send :include, CoreExtensions::Hash
