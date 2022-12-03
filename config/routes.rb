Jets.application.routes.draw do
  root "jets/public#show"

  100.times do |i|
    # get "test#{i}", to: "posts#index"
    get "hello#{i}", to: "hello#index#{i}"
  end
  100.times do |i|
    # get "test#{i}", to: "posts#index"
    get "good#{i}", to: "good#index#{i}"
  end
  # Use below to to test and reproduce issues:
  # Note: Would probably have to change Gemfile and point jets to previous versions.

  # 1. main issue about routes moving pages
  # get "hello3a", to: "hello#index8"

  # 2. Jets::Resource::ApiGateway::RestApi::Routes::Change::To#changed?
  # Use get "test_to" to reproduce
  get "test_to", to: "hello#index0"
  # get "test_to", to: "hello#index1"

  # 3. Jets::Resource::ApiGateway::RestApi::Routes::Change::Variable#changed?
  # Use resources :posts, param: :my_post_id to reproduce
  resources :posts
  # resources :posts, param: :my_post_id

  # The jets/public#show controller can serve static utf8 content out of the public folder.
  # Note, as part of the deploy process Jets uploads files in the public folder to s3
  # and serves them out of s3 directly. S3 is well suited to serve static assets.
  # More info here: https://rubyonjets.com/docs/extras/assets-serving/
  any "*catchall", to: "jets/public#show"
end
