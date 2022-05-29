class Api::V1::MembersController < ApplicationController
  before_action :doorkeeper_authorize!, only: [:index, :deposit]
  before_action :get_member, only: [:deposit]
  def index
    members = Member.all
    render json: members
  end
  def deposit
    @member.total_deposit += params[:new_deposit]
    if @member.save
      render json: 'ប្រត្តិបត្តិការណ៍ដាក់ប្រាក់សន្សំជោគជ័យ។'
    else
      render staus: 500
    end
  end
  def get_member_by_name
    member = Member.where(name: params[:name])
    if member
      render json: member
    else
      render status: 404
    end
  end
  private
    def get_member
      @member = Member.find(params[:id])
    end
end
