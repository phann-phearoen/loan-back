class CreatePawn < ActiveRecord::Migration[7.0]
  def change
    create_table :pawns do |t|
      t.bigint "number"
      t.date "registered_date"
      t.string "registered_by"
      t.float "surface_area"
      t.float "estimated_value"
      t.string "north"
      t.string "east"
      t.string "south"
      t.string "west"
      t.string "other_assets"
      t.timestamps
    end
  end
end
