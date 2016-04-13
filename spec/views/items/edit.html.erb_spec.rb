require 'rails_helper'

RSpec.describe "items/edit", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :pallet_id => "MyString",
      :deal_code => "MyString",
      :asin => "MyString",
      :description => "MyString",
      :spreadsheet => ""
    ))
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(@item), "post" do

      assert_select "input#item_pallet_id[name=?]", "item[pallet_id]"

      assert_select "input#item_deal_code[name=?]", "item[deal_code]"

      assert_select "input#item_asin[name=?]", "item[asin]"

      assert_select "input#item_description[name=?]", "item[description]"

      assert_select "input#item_spreadsheet[name=?]", "item[spreadsheet]"
    end
  end
end
