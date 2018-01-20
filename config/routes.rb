Rails.application.routes.draw do
  get 'hospitals/edit'

  get 'staffs/index'

  get 'staffs/new'

  get 'staffs/create'

  get 'staffs/edit'

  get 'staffs/update'

  get 'staffs/destroy'

  get 'staffs/show'

  root 'hospitals#index'
  resources :hospitals
  resources :staffs
  get 'hospitals/update'
  get 'hospitals/index'

  get 'hospitals/create'

  get 'hospitals/show'

  get 'hospitals/destroy'
  get 'hospitals/new'

  get 'hospitals/:id/staffs/:staff_id', to: 'hospitals#lay_off', as: :layoff
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
