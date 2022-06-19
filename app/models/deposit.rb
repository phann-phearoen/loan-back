class Deposit < ApplicationRecord
  belongs_to :member

  def self.commit_deposit transaction_params
    transaction = Deposit.new(
      amount: transaction_params[:amount],
      member_id: transaction_params[:id]
    )
    if transaction.save
      transaction
    else
      "error"
    end
  end
end
