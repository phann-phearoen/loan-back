class Loan < ApplicationRecord
  belongs_to :member
  has_many :pawns
  def self.show_member_loan member
    Loan.where(member_id: member.id).sum(:amount)
  end
  def self.total_loans
    Loan.all.sum(:amount)
  end
end