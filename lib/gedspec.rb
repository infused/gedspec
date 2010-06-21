require 'active_support/inflector'

module Gedspec
  autoload :Individual,   'gedspec/individual'
  autoload :PersonalName, 'gedspec/personal_name'
  
  module Gedcom
    autoload :Structure, 'gedspec/gedcom/structure'
    autoload :File,      'gedspec/gedcom/file'
  end
end