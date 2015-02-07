# encoding: utf-8

lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
require 'gedspec/version'

Gem::Specification.new do |s|
  s.name = 'gedspec'
  s.summary = 'Gedspec: The ruby gedcom parser'
  s.description = 'Gedspec: The ruby gedcom parser'
  s.version = Gemspec::VERSION
  s.authors = ["Keith Morrison"]
  s.email = 'keithm@infused.org'
  s.homepage = 'http://github.com/infused/gedspec'

  s.rdoc_options = ['--charset=UTF-8']
  s.extra_rdoc_files = ['README.md', 'LICENSE']
  s.files = Dir['[A-Z]*', '{docs,lib,spec}/**/*']
  s.test_files = Dir.glob('spec/**/*_spec.rb')
  s.require_paths = ['lib']

  s.required_rubygems_version = '>= 1.3.0'
  s.add_dependency 'activesupport', '~> 3.2.0'
  s.add_dependency 'i18n', '~> 0.6.0'
end
