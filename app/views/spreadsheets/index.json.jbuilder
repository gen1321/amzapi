json.array!(@spreadsheets) do |spreadsheet|
  json.extract! spreadsheet, :id, :name, :file
  json.url spreadsheet_url(spreadsheet, format: :json)
end
