module Tweet
	class Data < Grape::API
	prefix 'api'
	version 'v1', using: :path

		helpers do 
			def client
			
				client = Twitter::REST::Client.new do |config|
	  			config.consumer_key        = "ZfKCy4nDDDDwHBfXrHZWZylm4"
	  			config.consumer_secret     = "sEbZkn6rrCZP1WsHnc7334LIVZln5Se0UkmBUrC6nhtcFrKiY8"
	  			config.access_token        = "2227138380-cGCSwbdKS1ncbsfFiNVgN501EBIRkjTX1DbMP7Q"
	  			config.access_token_secret = "iQKrJxI8TQVgIdiBSmtqeWZlKTAPx1Hi9i2FRfmYETYoI"
				end


			end

			def search(mention, limit)
				client.search("to:#{mention}", result_type: "recent").take(limit).collect do |twt|
  				returned_object = "#{twt.user.screen_name}: #{twt.text}"
  				# p twt.class
  				p returned_object.class
  				returned_object
  				
				end

			end
		end

		resource :tweet_data do
			
			desc "List All Tweets About lacrosse"
			params do
				requires :mention, type: String
				requires :limit, type: Integer
			end
			get do
				search(params[:mention],params[:limit])
				# twitter_search = search(params[:mention],params[:limit])
				# twitter_search.JSON
				# twitter_search
			end

			desc "create a new lax Tweet"
			## This takes care of parameter validation
			params do
			  requires :screen_name, type:String
			end
			# This takes care of creating employee
			post do
			  LaxTweet.create!({
			  	screen_name:params[:screen_name],
			    content:params[:content],
			    lat:params[:lat],
			    lng:params[:lng],
			    hashtags:params[:hashtags],
			    date:params[:date]
			  })
			end

			desc "delete a tweet"
			params do
				requires :id, type:String
			end
			delete ':id' do
				LaxTweet.find(params[:id]).destroy!
			end

			desc "update a LaxTweet lng"
			params do
				requires :id, type:String
				# requires :lat, type:Float
				requires :lng, type:Float
			end

			put ':id' do
				LaxTweet.find(params[:id]).update({
					# lat:params[:lat],
					lng:params[:lng]
					})
			end


		end
	end		
end