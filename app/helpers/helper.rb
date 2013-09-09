helpers do 

  def client
    @client = Twitter::Client.new(
    :oauth_token => '#hashed',
    :oauth_token_secret => '#hashed')
  end

end
