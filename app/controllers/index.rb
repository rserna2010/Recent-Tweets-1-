get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:username' do
  @user = TwitterUser.find_by_username(params[:username])
  if @user.tweets.empty? || @user.tweets_stale?
    # if @user.tweets.empty?
    #   @user.fetch_tweets!
    # end
    # @ten_tweets = @user.tweets.limit(10)
    @user.fetch_tweets!
  end

  @ten_tweets = @user.tweets.limit(10)
  erb :lastest
end
