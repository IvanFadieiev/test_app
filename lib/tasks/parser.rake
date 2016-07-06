namespace :parser do
  desc 'Parsing of the https://news.ycombinator.com/'
  task news: :environment do
    require 'open-uri'
    require 'nokogiri'
    require 'byebug'

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

    # parsed_data = []
    # data = Nokogiri::HTML(open(source.to_s))
    # data.css('.athing').map do |news|
    # 	url   = news.at_css("a.storylink")['href']
    # 	author = news.at_css(".sitestr").text unless news.at_css(".sitestr").nil?
    # 	title = news.at_css("a.storylink").text
    # 	parsed_data << {url: url, title: title, author: author }
    # end
    # p parsed_data
    # p parsed_data.count


  end
end
