module Tweet
	class Data < Grape::API

		resource :tweet_data do
			desc "List All Tweets About lacrosse"
			
			get do
				LaxTweet.all
				
			end

			desc "create a new lax Tweet"
			## This takes care of parameter validation
			params do
			  requires :screen_name, type:String
			  # requires :content, type:Text
			  # requires :lat, type:Float
			  # requires :lng, type:Float
			  # requires :hashtags, type:Text
			  # requires :date, type:Datetime
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