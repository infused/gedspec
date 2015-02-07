PROJECT_ROOT = File.expand_path(File.dirname(__FILE__))
$: << File.join(PROJECT_ROOT, 'lib')

require 'bundler'
Bundler.setup
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new :spec do |t|
  t.rspec_opts = %w(--color)
end

task :default => :spec

desc "Open an irb session preloaded with this library"
task :console do
  sh "irb -rubygems -I lib -r gedspec.rb"
end
