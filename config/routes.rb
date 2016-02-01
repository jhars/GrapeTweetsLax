Rails.application.routes.draw do
  get 'import_tweet_data/index'

  mount API => '/'




#       import_tweet_data_index GET       /import_tweet_data/index(.:format)   import_tweet_data#index
#       api                               /                                    API

end

