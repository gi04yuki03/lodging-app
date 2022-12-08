Rails.application.routes.draw do
  devise_for :users
  resources :users, only:[:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'top' => 'homes#top'
  root to: 'homes#top'
  resources :posts do
    collection do
      get 'search'
    end
  end
  resources :posts do
    resources :reservations
  end 
  
end
