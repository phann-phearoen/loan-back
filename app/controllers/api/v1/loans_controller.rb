class Api::V1::LoansController < ApplicationController
  before_action :doorkeeper_authorize!, only: [:new_loan]

  def get_total_loans
    total_loans = Loan.total_loans
    render json: total_loans
  end
  def new_loan
    loan_hash = params
    loan = Loan.create_new_loan loan_hash
    if loan
      render json: loan
    else
      render status 500
    end
  end
end