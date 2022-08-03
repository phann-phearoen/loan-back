class Member < ApplicationRecord
  def self.create_new_member member_params
    member = Member.new()
    member.name = member_params[:name]
    member.gender = member_params[:gender]
    member.date_of_birth = member_params[:date_of_birth]
    member.national_id = member_params[:national_id]
    member.phone = member_params[:phone]
    member.nationality = member_params[:nationality]
    member.ethnicity = member_params[:ethnicity]
    member.address = member_params[:address]
    member.is_client = member_params[:is_client]

    member.save!
    member
  end

  def self.all_members page, per
    members = Member.where(is_client: false).page(page).per(per)
    resp_members = []
    members.each do |m|
      resp_members.push m.show_member m
    end
    rtv = {
      members: resp_members,
      total_count: members.total_count,
      total_pages: members.total_pages
    }
  end
  def self.all_clients 
    Member.where(is_client: true)
  end

  attribute :name
  attribute :gender
  attribute :date_of_birth
  attribute :national_id
  attribute :phone
  attribute :address
  attribute :is_client
  attribute :deposit
  attribute :loan
  def show_member member
    self.name = member.name
    self.gender = member.gender
    self.date_of_birth = member.date_of_birth
    self.national_id = member.national_id
    self.phone = member.phone
    self.address = member.address
    self.deposit = Deposit.show_member_deposit member || 0
    self.loan = Loan.show_member_loan member || 0

    self
  end
end