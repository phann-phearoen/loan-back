class Loan < ApplicationRecord
  belongs_to :member
  def self.show_member_loan member
    Loan.where(member_id: member.id).last
  end
end