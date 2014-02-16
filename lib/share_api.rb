require 'httparty'
require 'json'
require 'snoo'

class ShareApi

  def self.twitter_shares(url)
    base_uri = "https://cdn.api.twitter.com/1/urls/count.json?url="
    response = HTTParty.get(base_uri + url)
    json = JSON.parse(response.body)
    shares = json["count"]
    # puts "*****************"
    # puts "TWITTER SHARE COUNT: "
    #puts shares
    return shares
  end

  def self.fb_shares(url)
    base_uri = "http://graph.facebook.com/"
    response = HTTParty.get(base_uri + url)
    json = JSON.parse(response.body)
    shares = json["shares"]
    # puts "*****************"
    # puts "FB SHARE COUNT: "
    #puts shares
    return shares
  end

  #TODO: reddit
  def self.reddit_score(url)
    reddit = Snoo::Client.new
    listings = reddit.info({ :url => url })
    # response = HTTParty.get(base_uri + url)
    # json = JSON.parse(response.body)
    # shares = json["count"]
    # puts "*****************"
    # puts "listings: "
    puts listings
    #puts "REDDIT SCORE: "
    #puts shares
    #return shares
  end

  def self.reddit_top(limit=100)
    reddit = Snoo::Client.new
    reddit.log_in 'news_fetch', '$marcsmom22'
    listings = reddit.get_listing({ :page => 'top' })
    listings["data"]["children"].each do |listing|
      url = listing["data"]["url"]
      title = listing["data"]["title"]
      score = listing["data"]["score"]
      puts title
      puts url
      link = Link.create({ :url => url, :title => title })
      #link.shares = score
      #link.save
      # puts "REDDIT TOP 100"
      # puts title# + " ::: " + score.to_s
    end

    # response = HTTParty.get(base_uri + url)
    # json = JSON.parse(response.body)
    # shares = json["count"]

    # puts "*****************"
    # puts "listings: "
    # puts listings
    # puts "REDDIT SCORE: "

    #puts shares
    #return shares
  end

end
