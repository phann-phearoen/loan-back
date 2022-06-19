class AlterMemberToFitLoanAgreement < ActiveRecord::Migration[7.0]
  def change
    remove_column :members, :total_deposit
    remove_column :members, :loan
    add_column :members, :nationality, :string
    add_column :members, :ethnicity, :string
    add_column :members, :address, :string
  end
end
