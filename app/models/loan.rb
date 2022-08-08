class Loan < ApplicationRecord
  belongs_to :member
  has_many :pawns
  def self.show_member_loan member
    Loan.where(member_id: member.id).sum(:amount)
  end
  def self.total_loans
    Loan.all.sum(:amount)
  end
  def self.create_new_loan loan_hash
    loan = Loan.new
    loan.member_id = loan_hash[:member_id]
    loan.amount = loan_hash[:amount]
    loan.rate = loan_hash[:rate]
    loan.period = loan_hash[:period]
    loan.pawns_id = loan_hash[:pawn_id]
    if loan.save
      loan
    end
  end
end