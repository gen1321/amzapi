json.array!(@items) do |item|
  json.extract! item, :id, :pallet_id, :deal_code, :asin, :description, :spreadsheet
  json.url item_url(item, format: :json)
end
