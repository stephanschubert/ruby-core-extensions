$:.unshift File.join(File.dirname(__FILE__), "lib")

require "core_extensions/file"
require "core_extensions/hash"
require "core_extensions/hash/keys_as_methods"
require "core_extensions/nil_class"

File.send :include, CoreExtensions::File
Hash.send :include, CoreExtensions::Hash
Hash.send :include, CoreExtensions::Hash::KeysAsMethods
