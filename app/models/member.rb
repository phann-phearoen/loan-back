class Member < ApplicationRecord
  def self.create_new_member(
    name,
    gender,
    date_of_birth,
    national_id,
    phone,
    nationality,
    ethnicity,
    address,
    is_client
  )
    member = Member.new
    member.name = name
    member.gender = gender
    member.date_of_birth = date_of_birth
    member.national_id = national_id
    member.phone = phone
    member.nationality = nationality
    member.ethnicity = ethnicity
    member.address = address
    member.is_client = is_client

    member.save
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
  def self.get_all_clients page, per
    clients = Member.where(is_client: true).page(page).per(per)
    resp_clients = []
    clients.each do |m|
      resp_clients.push m.show_member m
    end
    rtv = {
      clients: resp_clients,
      total_count: clients.total_count,
      total_pages: clients.total_pages
    }
  end
  def self.all_clients 
    Member.where(is_client: true)
  end
  def self.get_one_member id
    member = Member.find(id)
    member.show_member member
    member
  end
  def self.get_member_by_name name
    member = Member.where(name: name).last
    member.show_member member
    member
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