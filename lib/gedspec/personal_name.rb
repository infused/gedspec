module Gedspec
  class PersonalName < Gedspec::Gedcom::Structure
    attr 'NAME',      :name
    attr 'NAME/NPFX', :npfx
    attr 'NAME/GIVN', :givn
    attr 'NAME/NICK', :nick
    attr 'NAME/SPFX', :spfx
    attr 'NAME/SURN', :surn
    attr 'NAME/NSFX', :nsfx
    
    # TODO: define custom parser for name without name parts specified individually
  end
end