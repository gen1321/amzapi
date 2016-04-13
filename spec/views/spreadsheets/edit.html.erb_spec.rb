require 'rails_helper'

RSpec.describe "spreadsheets/edit", type: :view do
  before(:each) do
    @spreadsheet = assign(:spreadsheet, Spreadsheet.create!(
      :name => "MyString",
      :file => ""
    ))
  end

  it "renders the edit spreadsheet form" do
    render

    assert_select "form[action=?][method=?]", spreadsheet_path(@spreadsheet), "post" do

      assert_select "input#spreadsheet_name[name=?]", "spreadsheet[name]"

      assert_select "input#spreadsheet_file[name=?]", "spreadsheet[file]"
    end
  end
end
