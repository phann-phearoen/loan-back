class Api::V1::MembersController < ApplicationController
  before_action :doorkeeper_authorize!, only: [:index, :deposit]
  before_action :get_user, only: [:deposit]
  
  def create_new_member
    member_params = {
      name: params[:name],
      gender: params[:gender],
      date_of_birth: params[:date_of_birth],
      national_id: params[:national_id],
      phone: params[:phone],
      nationality: params[:nationality] || 'Cambodian',
      ethnicity: params[:ethnicity] || 'Cambodian',
      address: params[:address],
      is_client: params[:is_client] || false
    }
    member = Member.create_new_member member_params
    if member
      render josn: member
    else
      render status 500
    end
  end
end