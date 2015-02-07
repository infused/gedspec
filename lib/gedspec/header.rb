module Gedspec
  class Header < Gedspec::Gedcom::Structure
    attribute 'CHAR', :char
    attribute 'FILE', :file
  end
end
