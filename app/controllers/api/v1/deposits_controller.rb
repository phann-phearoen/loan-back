class Api::V1::DepositsController < ApplicationController
  before_action :doorkeeper_authorize!, only: [:new_deposit]

  def new_deposit
    member_id = params[:id].to_i
    amount = params[:amount]
    deposit = Deposit.new_deposit member_id, amount
    if deposit
      render json: deposit
    else 
      render status 500
    end
  end

  def get_total_deposits
    total_deposits = Deposit.total_deposits
    render json: total_deposits
  end
end