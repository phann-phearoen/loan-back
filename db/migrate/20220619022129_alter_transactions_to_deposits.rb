class AlterTransactionsToDeposits < ActiveRecord::Migration[7.0]
  def change
    rename_table :transactions, :deposits
    remove_column :deposits, :transaction_type
  end
end
