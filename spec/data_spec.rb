
require "spec_helper"

describe Grape::API do
	include Rack::Test::Methods
  def app
    Tweet::Data
  end

  context "v1" do
    context "system" do
			it "should check that the response is a String" do 
				get "/api/v1/tweet_data.json?mention=warriorlacrosse&limit=3/"
				expect(last_response.body).to be_kind_of(String)
			end

		end
	end

end