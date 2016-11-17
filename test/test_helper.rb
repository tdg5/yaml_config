$LOAD_PATH.unshift(File.expand_path("../../lib", __FILE__))

if ENV["CI"]
  require "simplecov"
  require "coveralls"
  SimpleCov.formatter = Coveralls::SimpleCov::Formatter
  SimpleCov.root(File.expand_path("../..", __FILE__))
  SimpleCov.start do
    add_filter "test"
  end
end

require "yaml_config"
require "minitest/autorun"
require "mocha/setup"

# Use alternate shoulda-style DSL for tests
class YAMLConfig::TestCase < Minitest::Spec
  class << self
    alias :setup :before
    alias :teardown :after
    alias :context :describe
    alias :should :it
  end
end
