class Pawn < ApplicationRecord
  belongs_to :loan
  def self.create_new_pawn pawn_hash
    pawn = Pawn.new 
    pawn.number = pawn_hash[:no]
    pawn.registered_date = pawn_hash[:registered_date]
    pawn.registered_by = pawn_hash[:registered_by]
    pawn.surface_area = pawn_hash[:surface_area]
    pawn.north = pawn_hash[:north]
    pawn.east = pawn_hash[:east]
    pawn.south = pawn_hash[:south]
    pawn.west = pawn_hash[:west]
    other_assets = pawn_hash[:other_assets]
    pawn.save
    pawn
  end
end