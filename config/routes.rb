Rails.application.routes.draw do
  use_doorkeeper scope: 'api/v1/oauth' do
    controllers :tokens => 'api/v1/tokens'
  end
  
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get 'users'
      get 'users/get_all_users'
      get 'users/get_all_members'

      post 'members/create_new_member'
      get 'members/get_all_members'
      get 'members/get_one_member'
      get 'members/get_member_by_name'
      get 'members/get_total_members_count'
      get 'members/get_total_clients_count'

      post 'deposits/new_deposit'
      get 'deposits/get_total_deposits'

      get 'loans/get_total_loans'

      post 'pawns/new_pawn'
    end
  end
end
