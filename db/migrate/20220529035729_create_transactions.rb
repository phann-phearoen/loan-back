class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.belongs_to :member
      t.string "type", null: false
      t.float "amount", nul: false
      t.timestamps
    end
  end
end
