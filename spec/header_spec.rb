require 'spec_helper'

describe Gedspec::Header do
  let(:head) do
    Gedspec::Header.new <<-END
      0 HEAD
      1 SOUR GEDitCOM
      2 NAME GEDitCOM
      2 VERS 2.9.4
      2 CORP RSAC Software
      3 ADDR 7108 South Pine Cone Street
      4 CONT Salt Lake City, UT 84121
      4 CONT USA
      4 ADR1 RSAC Software
      4 ADR2 7108 South Pine Cone Street
      4 CITY Salt Lake City
      4 STAE UT
      4 POST 84121
      4 CTRY USA
      3 PHON +1-801-942-7768
      3 PHON +1-801-555-1212
      3 PHON +1-801-942-1148 (FAX) (last one!)
      2 DATA Name of source data
      3 DATE 1 JAN 1998
      3 COPR Copyright of source data
      1 SUBM @SUBMITTER@
      1 SUBN @SUBMISSION@
      1 _HME @PERSON1@
      1 DEST ANSTFILE
      1 DATE 1 JAN 1998
      2 TIME 13:57:24.80
      1 FILE TGC55C.ged
      1 COPR � 1997 by H. Eichmann, parts � 1999-2000 by J. A. Nairn.
      1 GEDC
      2 VERS 5.5
      2 FORM LINEAGE-LINKED
      1 LANG English
      1 CHAR ANSEL
      2 VERS ANSI Z39.47-1985
      1 PLAC
      2 FORM City, County, State, Country
    END
  end

  it 'parses char' do
    expect(head.char).to eq 'ANSEL'
  end

  it 'parses file' do
    expect(head.file).to eq 'TGC55C.ged'
  end
end
