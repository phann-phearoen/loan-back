Rails.application.routes.draw do
  use_doorkeeper scope: 'api/v1/oauth' do
    controllers :tokens => 'api/v1/tokens'
  end
  
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get 'users', to: 'users#index'
      get 'users/get_all_users', to: 'users#get_all_users'
      put 'users/deposit', to: 'users#deposit'

      get 'members', to: 'members#index'
      get 'members/get_member_by_name', to: 'members#get_member_by_name'
      put 'members/deposit', to: 'members#deposit'
    end
  end
end
