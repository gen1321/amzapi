require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        :pallet_id => "Pallet",
        :deal_code => "Deal Code",
        :asin => "Asin",
        :description => "Description",
        :spreadsheet => ""
      ),
      Item.create!(
        :pallet_id => "Pallet",
        :deal_code => "Deal Code",
        :asin => "Asin",
        :description => "Description",
        :spreadsheet => ""
      )
    ])
  end

  it "renders a list of items" do
    render
    assert_select "tr>td", :text => "Pallet".to_s, :count => 2
    assert_select "tr>td", :text => "Deal Code".to_s, :count => 2
    assert_select "tr>td", :text => "Asin".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
