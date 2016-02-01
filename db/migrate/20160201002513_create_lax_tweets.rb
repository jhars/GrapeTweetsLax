class CreateLaxTweets < ActiveRecord::Migration
  def change
    create_table :lax_tweets do |t|
      t.string :screen_name
      t.text :content
      t.float :lat
      t.float :lng
      t.text :hashtags
      t.datetime :date

      t.timestamps null: false
    end
  end
end
