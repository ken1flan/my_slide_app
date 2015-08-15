Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["MY_SLIDE_GOOGLE_CLIENT_ID"], ENV["MY_SLIDE_GOOGLE_CLIENT_SECRET"]
  provider :twitter, ENV["MY_SLIDE_TWITTER_CONSUMER_KEY"], ENV["MY_SLIDE_TWITTER_CONSUMER_SECRET"]
end
