# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'rspec', 
  :version => 2,
  :all_after_pass => false,
  :all_on_start => false,
  :keep_failed => false do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end
