require 'rails_helper'

RSpec.describe "spreadsheets/index", type: :view do
  before(:each) do
    assign(:spreadsheets, [
      Spreadsheet.create!(
        :name => "Name",
        :file => ""
      ),
      Spreadsheet.create!(
        :name => "Name",
        :file => ""
      )
    ])
  end

  it "renders a list of spreadsheets" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
