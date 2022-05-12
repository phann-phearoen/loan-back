class AddRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_admin, :boolean, deafault: false
    add_column :users, :is_member, :boolean, deafault: false
    add_column :users, :is_client, :boolean, deafault: false
  end
end
