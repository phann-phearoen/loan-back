class Api::V1::MembersController < ApplicationController
  before_action :doorkeeper_authorize!, only: [:index, :deposit]
  before_action :get_member, only: [:view_member]
  def index
    page = params[:page] || 1
    per = params[:per] || 10
    members = Member.page(1).per(per)
    render json: {
      members: members,
      total_count: members.total_count,
      total_pages: members.total_pages
    }
  end
  def deposit
    transaction_params = {
      amount: params[:amount].to_f,
      id: params[:id]
    }
    member = Member.find(params[:id])
    commit = Deposit.commit_deposit transaction_params
    member.total_deposit += params[:amount].to_f
    if member.save && commit
      render json: {
        transaction: commit,
        message: 'ប្រត្តិបត្តិការណ៍ដាក់ប្រាក់សន្សំជោគជ័យ។'
      }
    else
      render staus: 500
    end
  end
  def get_member_by_name
    member = Member.where(name: params[:admin_name]).last
    if member
      member_detail = Member.get_member_detail member
      render json: member_detail
    else
      render 404
    end
  end
  def get_one_member
    member = Member.find(params[:id])

    if member
      member_detail = Member.get_member_detail member
      render json: member_detail
    else
      render status 404
    end
  end
  private
    def get_member
      @member = Member.find(params[:id])
    end
end
