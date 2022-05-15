class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string "name", null: false
      t.string "gender", null: false
      t.date "date_of_birth", null: false
      t.string "national_id", null: false
      t.float "total_deposit", limit: 53, default: 0.0
      t.float "loan", default: 0.0
      t.timestamps
    end
  end
end
