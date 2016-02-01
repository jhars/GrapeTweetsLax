class ImportTweetDataController < ApplicationController
  def index



  	baseurl = "https://api.twitter.com"
  	path    = "/1.1/statuses/user_timeline.json"
  	query   = URI.encode_www_form("screen_name" => "@RydeLacrosse",
  	    													"count" => "10")
  	address = URI("#{baseurl}#{path}?#{query}")
  	request = Net::HTTP::Get.new address.request_uri
  	# Print data about a list of Tweets
  	def print_timeline(tweets)
  	  # ADD CODE TO ITERATE THROUGH EACH TWEET AND PRINT ITS TEXT
  	    tweets.each do |tweet| 
  	        p tweet['text']
  	    end
  	end

  	# Set up HTTP.
  	http             = Net::HTTP.new address.host, address.port
  	http.use_ssl     = true
  	http.verify_mode = OpenSSL::SSL::VERIFY_PEER

  	# If you entered your credentials in the first
  	# exercise, no need to enter them again here. The
  	# ||= operator will only assign these values if
  	# they are not already set.
  	consumer_key ||= OAuth::Consumer.new "ZfKCy4nDDDDwHBfXrHZWZylm4", "sEbZkn6rrCZP1WsHnc7334LIVZln5Se0UkmBUrC6nhtcFrKiY8"
  	access_token ||= OAuth::Token.new "2227138380-cGCSwbdKS1ncbsfFiNVgN501EBIRkjTX1DbMP7Q", "iQKrJxI8TQVgIdiBSmtqeWZlKTAPx1Hi9i2FRfmYETYoI"

  	# Issue the request.
  	request.oauth! http, consumer_key, access_token
  	http.start
  	response = http.request request

  	# Parse and print the Tweet if the response code was 200
  	tweets = nil
  	if response.code == '200' then
  	  tweets = JSON.parse(response.body)
  	  print_timeline(tweets)
  	end
  end
end
