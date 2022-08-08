class Api::V1::LoansController < ApplicationController
  before_action :doorkeeper_authorize!, only: [:new_pawn]

  def new_pawn
    pawn_hash = params
    pawn = Pawn.create_new_pawn pawn_hash
    if pawn
      render json: pawn
    else
      render status 500
    end
  end
end