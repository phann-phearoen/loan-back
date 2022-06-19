class CreateAgreement < ActiveRecord::Migration[7.0]
  def change
    create_table :agreements do |t|
      t.string "name", null: false
      t.string "gender", null: false
      t.date "date_of_birth", null: false
      t.string "national_id", null: false
      t.string "nationality", null: false, default: "ខ្មែរ"
      t.string "ethnicity", null: false, default: "ខ្មែរ"
      t.string "address", null: false
      t.float "amount", null: false
      t.float "rate", null: false
      t.integer "period", null: false
      t.string "pawn"
      t.timestamps
    end
  end
end
