class Loan < ApplicationRecord
  belongs_to :member
  has_many :pawns
  def self.show_member_loan member
    Loan.where(member_id: member.id).sum(:amount)
  end
  def self.total_loans
    Loan.all.sum(:amount)
  end
  def self.create_new_loan(
    member_id,
    amount,
    rate,
    period,
    pawn_id
  )
    loan = Loan.new
    loan.member_id = member_id
    loan.amount = amount
    loan.rate = rate
    loan.period = period
    loan.pawns_id = pawn_id
    loan.save
  end
end