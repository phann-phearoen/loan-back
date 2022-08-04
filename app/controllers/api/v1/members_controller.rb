class Api::V1::MembersController < ApplicationController
  before_action :doorkeeper_authorize!, only: [:create_new_member]
  
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

  def get_all_members
    page = params[:page] || 1
    per = params[:per] || 10
    members = Member.all_members page, per
    render json: members
  end

  def get_one_member
    id = params[:id]
    if id
      member = Member.get_one_member id
      render json: member
    else
      render status 500
    end
  end
end