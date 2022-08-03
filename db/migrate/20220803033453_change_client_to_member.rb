class ChangeClientToMember < ActiveRecord::Migration[7.0]
  def change
    rename_table :clients, :members
  end
end
