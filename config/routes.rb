Rails.application.routes.draw do

  root 'greetings#main_page'

  get 'rake_task',   to: 'greetings#rake_task'
  get 'all_posts',   to: 'posts#index'
  get 'post/:id', 	 to: 'posts#show', 					as: 'post'
  get 'posts_json',  to: 'posts#index_json',		as: 'posts_json'
  get 'delete_all',	 to: 'posts#delete_all', as: 'delete'
end
