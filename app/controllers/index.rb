get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:username' do
  @current_user = TwitterUser.find_or_create_by_username(params[:username])
  @ten_tweets = @current_user.tweets.limit(10)
  erb :lastest
end

post '/username' do 
  @user = TwitterUser.find_or_create_by_username(params[:username])
  if @user.tweets.empty? || @user.tweets_stale?
     @user.fetch_tweets!
  end

  redirect to '/:username'
end