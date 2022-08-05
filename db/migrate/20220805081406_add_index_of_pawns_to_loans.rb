class AddIndexOfPawnsToLoans < ActiveRecord::Migration[7.0]
  def change
    add_reference :loans, :pawns, index: true
    remove_column :loans, :agreeement_id
    remove_column :loans, :pawn
  end
end
