Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
    
    end
  end
end
