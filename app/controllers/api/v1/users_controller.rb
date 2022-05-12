class Api::V1::UsersController < ApplicationController
  before_action :doorkeeper_authorize!, only: [:index, :deposit]
  before_action :get_user

  def index
    users = User.all
  end
  def deposit
    if @me.is_admin
      user = User.find(params[:id])
      user.total_deposit += params[:new_deposit]
      if user.save
        render json: 'ប្រត្តិបត្តិការណ៍ដាក់ប្រាក់សន្សំជោគជ័យ។'
      else
        render staus: 500
      end
    end
  end

  private
    def get_user
      @me = User.find(params[:id])
    end
end