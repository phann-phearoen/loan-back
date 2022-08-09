class Api::V1::MembersController < ApplicationController
  before_action :doorkeeper_authorize!, only: [:create_new_member]
  
  def create_new_member
    name          = params[:name]
    gender        = params[:gender]
    date_of_birth = params[:date_of_birth]
    national_id   = params[:national_id]
    phone         = params[:phone]
    nationality   = params[:nationality] || 'Cambodian'
    ethnicity     = params[:ethnicity] || 'Cambodian'
    address       = params[:address]
    is_client     = params[:is_client] || false

    member = Member.create_new_member(
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

  def get_member_by_name
    name = params[:admin_name]
    if name
      rtv = Member.get_member_by_name name
      render json: rtv
    else
      render status 500
    end
  end

  def get_total_members_count
    total_members = Member.where(is_client: false).count 
    render json: total_members
  end

  def get_total_clients_count
    total_clients = Member.where(is_client: true).count
    render json: total_clients
  end
end