get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:username' do
  @user = TwitterUser.find_or_create_by_username(params[:username])
  puts "made it to get route"
  @user.fetch_tweets!

  @ten_tweets = @user.tweets.limit(10)
  @loading = false
  erb :lastest
end

post '/username' do 
  @user = TwitterUser.find_or_create_by_username(params[:username])
  if @user.tweets.empty? || @user.tweets_stale?
     @loading = true
  end

  @ten_tweets = @user.tweets.limit(10)
  erb :lastest
end