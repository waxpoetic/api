begin
  require 'rubocop/rake_task'

  RuboCop::RakeTask.new :lint
rescue NameError
  # RuboCop isn't available in all environments.
end
