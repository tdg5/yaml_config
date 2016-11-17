guard(:minitest, :all_after_pass => false, :all_on_start => false) do
  notification(:off)
  watch(%r{^lib/yaml_config/(.+)\.rb$}) { |m| "test/unit/#{m[1]}_test.rb" }
  watch(%r{^test/.+_test\.rb$})
  watch(%r{^(?:test/test_helper(.*)|lib/yaml_config)\.rb$}) { "test" }
end
