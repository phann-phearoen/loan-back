class Deposit < ApplicationRecord
  belongs_to :member

  def self.new_deposit member_id, amount
    deposit = Deposit.new
    deposit.member_id = member_id
    deposit.amount = amount
    if deposit.save
      deposit
    end
  end
  def self.show_member_deposit member
    Deposit.where(member_id: member.id).sum(:amount)
  end
  def self.total_deposits 
    Deposit.all.sum(:amount)
  end
end
