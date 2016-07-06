namespace :parser do
  desc 'Parsing of the https://news.ycombinator.com/'
  task news: :environment do
    require 'open-uri'
    require 'nokogiri'
    require 'byebug'
    Post.all.delete_all
    source = 'https://news.ycombinator.com/'
    parsed_data = []
    error = []
    all_pages = ['news?p=1', 'news?p=2', 'news?p=3', 'news?p=4', 'news?p=5']
    all_pages.map do |page|
      data = Nokogiri::HTML(open(source.to_s + page))
      data.css('.athing').map do |news|
      	begin
		    	url    = news.at_css(".storylink")['href']
		    	author = news.at_css(".sitestr").text unless news.at_css(".sitestr").nil?
		    	title  = news.at_css(".storylink").text
		    	parsed_data << {url: url, title: title, author: author }
		    rescue
		    	error << news
		    end
	    end
    end

    parsed_data.map do |post|
		  Post.create(title: post[:title], author: post[:author], url: post[:url])
		  p post[:title] + ' was created'
		end

  end
end
