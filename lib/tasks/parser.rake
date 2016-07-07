namespace :parser do
  desc 'Parsing of the https://news.ycombinator.com/'
  task news: :environment do
    
    require 'open-uri'
    require 'nokogiri'
    require 'byebug'
    require 'sidekiq'

    source = 'https://news.ycombinator.com/'
    error = []
    all_pages = ['news?p=1', 'news?p=2', 'news?p=3', 'news?p=4', 'news?p=5']
    all_pages.map do |page|
      data = Nokogiri::HTML(open(source.to_s + page))
      data.css('.athing').map do |news|
      	begin
		    	url    = news.at_css(".storylink")['href']
		    	author = news.next.at_css(".subtext a").text
		    	title  = news.at_css(".storylink").text
		    	Post.delay.create(title: title, author: author, url: url)
          p 'Post add to the queue: ' + title
		    rescue
		    	error << news
		    end
	    end
    end
  end
end
