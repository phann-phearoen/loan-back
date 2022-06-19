class Member < ApplicationRecord
  has_many :deposits, dependent: :delete_all

  def self.get_member_detail member
    member.show_member_detail member
  end

  attribute :total_deposit
  attribute :total_loan
  def show_member_detail member
    deposits = Deposit.where(member_id: member.id)
    total_deposit = 0.00
    deposits.each do |d|
      total_deposit += d.amount
    end
    self.total_deposit = total_deposit
    self.total_loan = 0.00

    self
  end
end
