class CreateLoan < ActiveRecord::Migration[7.0]
  def change
    create_table :loans do |t|
      t.bigint "member_id"
      t.bigint "agreement_id"
      t.float "amount", null: false
      t.float "rate", null: false
      t.integer "period", null: false
      t.string "pawn"
      t.timestamps
    end
  end
end
