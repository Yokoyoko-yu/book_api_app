Rails.application.routes.draw do
  get 'find/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to:"static_pages#home"
  # get 'book_info',to:'static_pages#show_book_info'
  # get 'show_image',to:'static_pages#show_book_info'
  # post 'show_image',to:"static_pages#show_book_info"
  # get 'search_author',to:"static_pages#search_author"
  get 'search_image',to:"find_image#home"
  post 'find_image',to:"find_image#find"
  get 'book_image',to:"find_image#show"
  get 'search_author',to:"find_from_author#home"
  post 'find_author',to:"find_from_author#find"
  get 'show_author',to:"find_from_author#show"
end
