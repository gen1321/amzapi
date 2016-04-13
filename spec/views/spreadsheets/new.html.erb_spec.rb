require 'rails_helper'

RSpec.describe "spreadsheets/new", type: :view do
  before(:each) do
    assign(:spreadsheet, Spreadsheet.new(
      :name => "MyString",
      :file => ""
    ))
  end

  it "renders new spreadsheet form" do
    render

    assert_select "form[action=?][method=?]", spreadsheets_path, "post" do

      assert_select "input#spreadsheet_name[name=?]", "spreadsheet[name]"

      assert_select "input#spreadsheet_file[name=?]", "spreadsheet[file]"
    end
  end
end
