desc "Fetch news item links"  
task :fetch_news => :environment do  
  	#require 'open-uri'    
  	require 'nokogiri'
  	require 'share_api'
  	require 'httparty'
 #  	scraper = Upton::Scraper.new("https://news.google.com/", ".section-content .esc-lead-article-title a")
 #  	scraper.scrape do |item|
 #  		puts "article title: "
 #  		puts "#{item}"
 #  		#or, do other stuff here.
	# end

	puts "Fetching news stories..."

	news = Nokogiri::HTML(open("https://news.google.com/"))
	news.css(".section-content .esc-lead-article-title").each do |item|
		title = item.at_css(".titletext").text
		url = item.at_css("a")['url']
  		#or, do other stuff here.
  		Link.create({ :url => url, :title => title })
	end

	doc = Nokogiri::XML(open("http://rss.nytimes.com/services/xml/rss/nyt/HomePage.xml"))
	doc.css("item").each do |item|
		#puts item.css("title").inner_text
		title = item.css("title").inner_text
		url = item.css("link").inner_text
  		#or, do other stuff here.
  		Link.create({ :url => url, :title => title })
	end

	doc = Nokogiri::XML(open("http://feeds.huffingtonpost.com/huffingtonpost/raw_feed"))
	doc.css("item").each do |item|
		#puts item.css("title").inner_text
		title = item.css("title").inner_text
		url = item.css("link").inner_text
  		#or, do other stuff here.
  		Link.create({ :url => url, :title => title })
	end

	ShareApi.reddit_top

	puts "Querying social networks for share counts"
	
	Link.all.each do |link|
		#puts "title:"
		#puts link.title
		shares = ShareApi.twitter_shares(link.url)
		shares = ShareApi.fb_shares(link.url)
		#puts "SAVING SHARES: " + shares.to_s
		link.shares = shares
		link.save
	end

	puts "************TOP 10 NEWS ITEMS************"
	Link.find(:all, :limit => 10, :order => "shares DESC").each do |link|
		puts link.title + " - " + link.shares.to_s
		#get title direct from news page
		# begin
		# 	doc = Nokogiri::HTML(HTTParty.get(link.url))
		# 	title = doc.css("title").text.split('|')[0].strip
		# 	puts title + " - " + link.shares.to_s
		# rescue OpenURI::HTTPError => e
		# 	puts "HTTP ERROR"
		# #title = title.split('|')[0]
		# end
	end
	#ShareApi.reddit_top()
  # NewsHub.all.each do |hub|
  # 	scraper = Upton::Scraper.new(hub.url, url.xpath)
  # end 

  # Product.find_all_by_price(nil).each do |product|  
  #   escaped_product_name = CGI.escape(product.name)  
  #   url = "http://www.walmart.com/search/search-ng.do?search_constraint=0&ic=48_0&search_query=#{escaped_product_name}&Find.x=0&Find.y=0&Find=Find"  
  #   doc = Nokogiri::HTML(open(url))  
  #   price = doc.at_css(".PriceXLBold, .PriceCompare .BodyS").text[/[0-9\.]+/]  
  #   product.update_attribute(:price, price)  
  # end  
end  


task :build_all do
    Rake::Task["fetch_news"].reenable
    Rake::Task["fetch_news"].invoke
end