require 'asin'

describe 'It should retrive a data from amazon)' do

  it 'should do something' do
    ASIN::Configuration.configure do |config|
      config.secret        = 'oNhYNXuS4FjvVgSHoPp9383MmqcmmXsJfpw0t6uH'
      config.key           = 'AKIAI42PXZ2Q3M2SUVBQ'
      config.associate_tag = 'mborisbeginin-20'
    end
    client = ASIN::Client.instance
    items = client.lookup 'B00XVPJC4G'

    expect(items.first[:offer_summary][:lowest_collectible_price][:formatted_price]).not_to eq(nil)
  end
end