Rails.application.routes.draw do
  resources :chemical_structures
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'welcome/get_marvin'
  root 'welcome#index'
  get 'welcome/index'
  post 'welcome/save_marvin'

  get 'validate_name' =>'chemical_structures#validate_name'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
