class TwitterUser < ActiveRecord::Base
  has_many :tweets

  def fetch_tweets!
   Twitter.user_timeline(self.username).each do |tweet|
      self.tweets << Tweet.create(text: tweet.text)
    end
  end

  def tweets_stale?
     ((Time.now - self.tweets.first.created_at) / 60) > 15.00
  end
end
