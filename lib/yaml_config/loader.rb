require "yaml"
require "erb"

module YAMLConfig
  class Loader
    EXT_MATCHER = /\.yml/

    def initialize(env, config_dir, config_names)
      @env = env.to_s
      @config_dir = config_dir
      @config_names = config_names
    end

    def config
      return @config if @config
      all_configs = {}
      @config_names.map do |config_name|
        config_file = config_name.to_s + ".yml"
        config_path = File.join(@config_dir, config_file)
        config = load_config(config_path)
        env_config = config[@env] || config
        all_configs[config_name] = env_config
      end
      @config = structify(all_configs)
    end

    private

    def load_config(config_path)
      derived_yaml = ERB.new(File.read(config_path)).result
      YAML.load(derived_yaml)
    end

    def structify(value)
      case value
      when Hash
        keys = []
        values = []
        value.each_pair do |key, val|
          keys << key.to_sym
          values << structify(val)
        end
        s = Struct.new(*keys)
        s.new(*values)
      when Enumerable
        value.map(&method(__method__))
      else
        value
      end
    end
  end
end
