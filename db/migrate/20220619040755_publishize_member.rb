class PublishizeMember < ActiveRecord::Migration[7.0]
  def change
    rename_table :members, :clients
    add_column :clients, :is_member, :boolean, null: false
  end
end
