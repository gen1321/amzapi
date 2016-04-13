class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :pallet_id
      t.string :deal_code
      t.string :asin
      t.string :description
      t.string :retail_price
      t.belongs_to :spreadsheet
      t.timestamps null: false
    end
  end
end
