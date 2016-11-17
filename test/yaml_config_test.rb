require "test_helper"

module YAMLConfig
  class YAMLConfigTest < TestCase
    should "have a version number" do
      refute_nil ::YAMLConfig::VERSION
    end
  end
end
