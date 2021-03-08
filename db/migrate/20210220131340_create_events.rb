class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :details, null: false
      t.integer :category_id, null: false
      t.integer :activities_category_id, null: false
      t.integer :event_prefecture_id, null: false
      t.integer :event_facility
      t.integer :people_number_id, null: false
      t.integer :cost, null: false
      t.date :event_date, null: false
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.string :event_image_id
      t.references :user, foreign_key: true
      t.string :event_address
      t.timestamps
    end
  end
end
