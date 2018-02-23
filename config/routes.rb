Rails.application.routes.draw do
  root 'recipes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :recipes, only: [:index] do
    get 'bookmark'
    get 'unbookmark'
    get 'list_bookmarked_recipes', on: :collection
  end
end
