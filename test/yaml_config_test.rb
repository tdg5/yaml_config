require "test_helper"

module YAMLConfig
  class YAMLConfigTest < TestCase
    Subject = ::YAMLConfig

    subject { Subject }

    should "have a version number" do
      refute_nil subject.const_get(:VERSION)
    end

    context "load" do
      should "build expected structures" do
        env = :development
        config_dir = File.expand_path("../fixtures", __FILE__)
        configs = [:config_with_env, :config_without_env]
        config = subject.load(env, config_dir, configs)
        expected_values = {
          :an_array => %w[foo bar baz],
          :string => "Hello, World!",
          :boolean => true,
          :integer => 5,
          :float => 3.14,
        }
        configs.each do |config_name|
          subconfig = config.send(config_name)
          expected_values.each_pair do |key, value|
            assert_equal value, subconfig.send(key)
          end
        end
      end
    end
  end
end
