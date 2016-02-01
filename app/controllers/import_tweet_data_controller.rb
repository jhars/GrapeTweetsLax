class ImportTweetDataController < ApplicationController
  def index


  	# find_my_tweets_service = FindMyTweets.new
  	# find_my_tweets_service.find_my_tweets("@RydeLacrosse")

  	find_by_hashtag_service = FindByHashtag.new
  	find_by_hashtag_service.find_by_hashtag("GreaseLive")
  end
  
  def create

  end
end
