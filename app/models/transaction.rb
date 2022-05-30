class Transaction < ApplicationRecord
  belongs_to :member

  def self.commit_transaction transaction_params
    transaction = Transaction.new(
      amount: transaction_params[:amount],
      type: transaction_params[:type],
      member_id: transaction_params[:id]
    )
    if transaction.save
      transaction
    else
      "error"
    end
  end
end
