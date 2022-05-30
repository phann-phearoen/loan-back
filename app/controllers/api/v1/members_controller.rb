class Api::V1::MembersController < ApplicationController
  before_action :doorkeeper_authorize!, only: [:index, :deposit]
  before_action :get_member, only: [:view_member]
  def index
    members = Member.all
    render json: members
  end
  def deposit
    transaction_params = {
      amount: params[:amount].to_f,
      type: 'deposit',
      id: params[:id]
    }
    member = Member.find(params[:id])
    commit = Transaction.commit_transaction transaction_params
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
      render json: member
    else
      render 404
    end
  end
  private
    def get_member
      @member = Member.find(params[:id])
    end
end
