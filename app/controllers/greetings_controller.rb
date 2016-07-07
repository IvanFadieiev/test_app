class GreetingsController < ApplicationController
	def main_page
	end

	def rake_task
		Thread.new do
			system 'bundle exec sidekiqctl stop tmp/sidekiq.pid 0'
			system 'rake parser:news'
			system 'bundle exec sidekiq -d -P tmp/sidekiq.pid -L log/sidekiq.log'
		end
	end
end
