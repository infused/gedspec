# TODO: define custom parser for name without name parts specified individually

module Gedspec
  class PersonalName < Gedspec::Gedcom::Structure
    attribute 'NAME', :name, top_level: true
    attribute 'NPFX', :npfx
    attribute 'GIVN', :givn
    attribute 'NICK', :nick
    attribute 'SPFX', :spfx
    attribute 'SURN', :surn
    attribute 'NSFX', :nsfx
  end
end
