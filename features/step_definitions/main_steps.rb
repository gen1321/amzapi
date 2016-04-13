When(/^user upload spreadsheet$/) do
  visit('/spreadsheets/new')
  fill_in('Name',with:'Test')
  attach_file("File",'lib/testxls/sample.xlsx')
  click_on('Create Spreadsheet')
  expect(Spreadsheet.last.name).to eq('Test')
end

Then(/^App will create item for 1st row of Spreadsheet$/) do

  Spreadsheet.last.items
  expect(Spreadsheet.last.items.first.pallet_id).to eq('PLT092009292')
end

And(/^App will create item for last row of Spreadsheet$/) do
  Spreadsheet.last.items
  expect(Spreadsheet.last.items.last.pallet_id).to eq('PLT092009733')
end

Then(/^App will get info from Amazon api$/) do
  expect(Item.last.retail_price).not_to eq(nil)
end

Then(/^App will show html report  with Pallet id, item id, description, Amazon value \-\-\-\- total pallet value$/) do
  pending
end

Then(/^Repeat for each pallet$/) do
  pending
end


