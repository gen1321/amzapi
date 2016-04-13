require 'rails_helper'

RSpec.describe Spreadsheet, type: :model do
  let(:ss) {ss = Spreadsheet.create}
 describe "Relations work correctly" do
   it 'create item throught spreadsheet' do

     item = ss.items.create
     expect(item).not_to eq(nil)
   end
 end
  describe 'File upload works correctly' do
    it 'Spreadsheet file is not nil' do
      ss.file= File.new('lib/testxls/sample.xlsx','r')
      expect(ss.file.original_filename).to eq('sample.xlsx')
    end
  end
  describe 'File reading is working correctly' do
    it 'it can read a file' do
      xls = RubyXL::Parser.parse(File.new('lib/testxls/sample.xlsx','r'))
      expect(xls).not_to  eq(nil)
      p xls
    end
    it 'read 1st row' do
      xls = RubyXL::Parser.parse(File.new('lib/testxls/sample.xlsx','r'))
      workbook = xls[0]
      row = workbook[3]
      expect(row.cells[0].value).to eq('PLT092009292')
    end

  end
end
