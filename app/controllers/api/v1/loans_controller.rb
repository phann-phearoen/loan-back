class Api::V1::LoansController < ApplicationController
  before_action :doorkeeper_authorize!, only: [:new_loan]

  def get_total_loans
    total_loans = Loan.total_loans
    render json: total_loans
  end
end