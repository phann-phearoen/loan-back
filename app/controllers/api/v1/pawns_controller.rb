class Api::V1::PawnsController < ApplicationController
  before_action :doorkeeper_authorize!, only: [:new_pawn]

  def new_pawn
    number          = params[:no]
    registered_date = params[:registered_date]
    registered_by   = params[:registered_by]
    surface_area    = params[:surface_area]
    north           = params[:north]
    south           = params[:south]
    east            = params[:east]
    west            = params[:west]
    other_assets    = params[:other_assets]
    pawn = Pawn.create_new_pawn(
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
    render json: pawn
  end
end