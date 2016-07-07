Rails.application.routes.draw do
  resource :posts
  root 'greetings#main_page'
  get 'rake_task',   to: 'greetings#rake_task'
  get 'all_posts', to: 'posts#index'
end
