class Pawn < ApplicationRecord
  belongs_to :loan
  def self.create_new_pawn(
    number,
    registered_date,
    registered_by,
    surface_area,
    north,
    south,
    west,
    east,
    other_assets
  )
    pawn = Pawn.new
    pawn.number = number
    pawn.registered_date = registered_date
    pawn.registered_by = registered_by
    pawn.surface_area = surface_area
    pawn.north = north
    pawn.east = east
    pawn.south = south
    pawn.west = west
    other_assets = other_assets
    pawn.save
  end
end