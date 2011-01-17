module Gedspec
  class PersonalName < Gedspec::Gedcom::Structure
    attribute 'NAME',      :name
    attribute 'NAME/NPFX', :npfx
    attribute 'NAME/GIVN', :givn
    attribute 'NAME/NICK', :nick
    attribute 'NAME/SPFX', :spfx
    attribute 'NAME/SURN', :surn
    attribute 'NAME/NSFX', :nsfx
    
    # TODO: define custom parser for name without name parts specified individually
  end
end