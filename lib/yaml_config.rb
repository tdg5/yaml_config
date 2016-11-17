require "yaml_config/version"
require "yaml_config/loader"

module YAMLConfig
  def self.load(env, config_dir, config_names)
    Loader.new(env, config_dir, config_names).config
  end
end
