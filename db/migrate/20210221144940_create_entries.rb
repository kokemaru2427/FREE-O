class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.string :family_name, null: false
      t.string :last_name, null: false
      t.string :j_family_name, null: false
      t.string :j_last_name, null: false
      t.text :entry_comment
      t.string :entry_undergraduate, null: false
      t.string :entry_school_year, null: false 
      t.integer :entry_student_nunber, null: false
      t.string :sex, null: false 
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.timestamps
    end
  end
end
