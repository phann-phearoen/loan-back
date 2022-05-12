class AddLoanColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :loan, :string, default: 0
  end
end
