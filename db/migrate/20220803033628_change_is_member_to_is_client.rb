class ChangeIsMemberToIsClient < ActiveRecord::Migration[7.0]
  def change
    rename_column :members, :is_member, :is_client
  end
end
