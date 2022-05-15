class MembersController < ApplicationController
  def index
    members = Members.all
  end
end
