class Api::V1::UsersController < ApplicationController
  before_action :doorkeeper_authorize!, only: [:index, :deposit]
  before_action :get_user, only: [:deposit]

  def index
    users = User.all
  end
  def get_all_users
    users = User.where(is_member: true)
    render json: users
  end

  private
    def get_user
      @me = User.find(params[:id])
    end
end