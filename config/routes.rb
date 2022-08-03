Rails.application.routes.draw do
  use_doorkeeper scope: 'api/v1/oauth' do
    controllers :tokens => 'api/v1/tokens'
  end
  
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get 'users'
      get 'users/get_all_users'
      get 'users/get_all_members'
      put 'users/deposit'

      post 'members/create_new_member'
      get 'members/get_all_members'
    end
  end
end
