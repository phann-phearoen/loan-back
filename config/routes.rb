Rails.application.routes.draw do
  use_doorkeeper scope: 'api/v1/oauth' do
    controllers :tokens => 'api/v1/tokens'
  end
  
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get 'users', to: 'users#index'
    end
  end
end
