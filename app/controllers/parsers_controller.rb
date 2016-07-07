# parser controller
class ParsersController < ApplicationController
  def main_page
  end

  def rake_task
    system 'bundle exec sidekiqctl stop tmp/sidekiq.pid 0'
    system 'bundle exec sidekiq -d -P tmp/sidekiq.pid -L log/sidekiq.log'
    system 'rake parser:news'
  end
end
