module Gedspec
  class Header < Gedspec::Gedcom::Structure
    attribute 'DEST', :dest
    attribute 'CHAR', :char
    attribute 'FILE', :file
    attribute 'COPR', :copr
    attribute 'LANG', :lang
  end
end
