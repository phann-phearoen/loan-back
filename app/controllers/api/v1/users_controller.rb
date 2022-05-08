class Api::V1::UsersController < ApplicationController
  before_action :doorkeeper_authorize!, only: [:index]

  def index
    users = User.all
  end
end