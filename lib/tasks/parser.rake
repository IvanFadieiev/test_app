namespace :parser do
  desc 'Parsing of the https://news.ycombinator.com/'
  task news: :environment do
    ParserWorker.perform_async
  end
end
