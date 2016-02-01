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
  	def print_timeline(tweetsData)
  	  # ADD CODE TO ITERATE THROUGH EACH TWEET AND PRINT ITS TEXT
  	  tweets = tweetsData
  	    # tweets.each do |tweet|
  	    		# tweetInfo = JSON.pretty_generate(tweets)

  	    		# tweetData = tweetStatuses[0..1000]
  	        puts tweets

  	        # p tweets["statuses"]
  	        # p tweets["metadata"]

  	    # end
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
  	tweetsData = nil
  	if response.code == '200' then
  		# tweets = response.body
  	  tweetsData = JSON.parse(response.body)
  	  print_timeline(tweetsData)
  	end
	end
end