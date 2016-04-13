class CreateSpreadsheets < ActiveRecord::Migration
  def change
    create_table :spreadsheets do |t|
      t.string :name
      t.attachment :file

      t.timestamps null: false
    end
  end
end
