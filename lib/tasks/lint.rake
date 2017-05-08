begin
  require 'rubocop/rake_task'

  RuboCop::RakeTask.new :lint
rescue LoadError
  # RuboCop isn't available in all environments.
end
