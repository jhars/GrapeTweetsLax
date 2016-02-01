# require 'json'

class FindByHashtag
	def find_by_hashtag(hashtag)

  	baseurl = "https://api.twitter.com"
  	path    = "/1.1/search/tweets.json?q=%23#{hashtag}"
    query   = URI.encode_www_form(	#"screen_name" => user_name,
  	     													"count" => "10")
  	
  	address = URI("#{baseurl}#{path}")
  	# address = URI("#{baseurl}#{path}?#{query}")
  	request = Net::HTTP::Get.new address.request_uri
  	# Print data about a list of Tweets
  	def print_timeline(tweets_data)
      tweets_object = tweets_data[0]
  	    tweets_object.each do |tweet|
            p tweet
  	    end
  	end

  	# Set up HTTP.
  	http             = Net::HTTP.new address.host, address.port
  	http.use_ssl     = true
  	http.verify_mode = OpenSSL::SSL::VERIFY_PEER

  	consumer_key ||= OAuth::Consumer.new "ZfKCy4nDDDDwHBfXrHZWZylm4", "sEbZkn6rrCZP1WsHnc7334LIVZln5Se0UkmBUrC6nhtcFrKiY8"
  	access_token ||= OAuth::Token.new "2227138380-cGCSwbdKS1ncbsfFiNVgN501EBIRkjTX1DbMP7Q", "iQKrJxI8TQVgIdiBSmtqeWZlKTAPx1Hi9i2FRfmYETYoI"

  	# Issue the request.
  	request.oauth! http, consumer_key, access_token
  	http.start
  	response = http.request request

  	# Parse and print the Tweet if the response code was 200
  	tweets_data = nil
  	if response.code == '200' then
  	  tweets_data = JSON.parse(response.body)  #['statuses']
  	  print_timeline(tweets_data)
  	end
	end
end