require 'active_support/core_ext'

module Gedspec
  autoload :Individual,       'gedspec/individual'
  autoload :PersonalName,     'gedspec/personal_name'
  autoload :ReferenceNumber,  'gedspec/reference_number'
  
  module Gedcom
    autoload :Extract,        'gedspec/gedcom/extract'
    autoload :Structure,      'gedspec/gedcom/structure'
    autoload :File,           'gedspec/gedcom/file'
  end
end