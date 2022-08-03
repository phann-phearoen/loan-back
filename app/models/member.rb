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
end