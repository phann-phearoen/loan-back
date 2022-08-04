class Deposit < ApplicationRecord
  belongs_to :member

  def self.new_deposit member_id, amount
    transaction = Deposit.new
    transaction.member_id = member_id
    transaction.amount = amount
    if transaction.save
      transaction
    end
  end

  def self.show_member_deposit member
    Deposit.where(member_id: member.id).last
  end
end
