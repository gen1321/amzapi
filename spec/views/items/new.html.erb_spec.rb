require 'rails_helper'

RSpec.describe "items/new", type: :view do
  before(:each) do
    assign(:item, Item.new(
      :pallet_id => "MyString",
      :deal_code => "MyString",
      :asin => "MyString",
      :description => "MyString",
      :spreadsheet => ""
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "input#item_pallet_id[name=?]", "item[pallet_id]"

      assert_select "input#item_deal_code[name=?]", "item[deal_code]"

      assert_select "input#item_asin[name=?]", "item[asin]"

      assert_select "input#item_description[name=?]", "item[description]"

      assert_select "input#item_spreadsheet[name=?]", "item[spreadsheet]"
    end
  end
end
