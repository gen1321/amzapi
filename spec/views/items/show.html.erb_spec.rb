require 'rails_helper'

RSpec.describe "items/show", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :pallet_id => "Pallet",
      :deal_code => "Deal Code",
      :asin => "Asin",
      :description => "Description",
      :spreadsheet => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Pallet/)
    expect(rendered).to match(/Deal Code/)
    expect(rendered).to match(/Asin/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(//)
  end
end
