Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users
  resources :recipes  #recipesのmodelではrecipesのデータベースのみが紐づけされているためここにcaloriesのテーブルも紐づける
  post "recipes/search" => "recipes#search"
end
