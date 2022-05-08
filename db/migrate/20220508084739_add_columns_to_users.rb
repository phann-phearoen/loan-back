class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :gender, :string, null: false
    add_column :users, :date_of_birth, :date, null: false
    add_column :users, :national_id, :string, null: false
    add_column :users, :total_deposit, :double, null: false, default: 0
  end
end
