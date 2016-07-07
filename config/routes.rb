Rails.application.routes.draw do
  root 'parsers#main_page'

  get 'rake_task',   to: 'parsers#rake_task'
  get 'all_posts',   to: 'posts#index'
  get 'delete_all',	 to: 'posts#delete_all', as: 'delete'
  namespace :api do
    namespace :v1 do
      get 'post/:id',    to: 'posts#show',        as: 'post'
      get 'posts_json',  to: 'posts#index_json',  as: 'posts_json'
    end
  end
end
