class Api::V1::LoansController < ApplicationController
  before_action :doorkeeper_authorize!, only: [:new_loan]

  def get_total_loans
    total_loans = Loan.total_loans
    render json: total_loans
  end
  def new_loan
    member_id = params[:member_id]
    amount    = params[:amount]
    rate      = params[:rate]
    period    = params[:period]
    pawn_id   = params[:pawn_id]

    if member_id
      loan = Loan.create_new_loan(
        member_id,
        amount,
        rate,
        period,
        pawn_id
      )
      render json: loan
    else
      render status 500
    end
  end
end