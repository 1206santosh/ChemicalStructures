Rails.application.routes.draw do
  get 'edit' => 'chemical_structures#edit'
  get 'revert_back/:ref_id'=>'chemical_structures#revert_back'
  resources :chemical_structures
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'welcome/get_marvin'
  root 'chemical_structures#index'
  get 'welcome/index'
  post 'welcome/save_marvin'
  get 'add_as_new'=>'chemical_structures#add_as_new'
  get 'validate_name' =>'chemical_structures#validate_name'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
