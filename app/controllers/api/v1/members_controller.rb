class Api::V1::MembersController < ApplicationController
  before_action :doorkeeper_authorize!, only: [:index, :deposit]
  before_action :get_user, only: [:deposit]
  
  def add_new_member
    
  end
end