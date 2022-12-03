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
  # resources :posts, param: :post_id

  # Note: #3 when went from `resources :posts, param: :my_post_id` back to `resources :posts`
  # initially got a CloudFormation error on the AWS side at update_stack
  # https://github.com/boltops-tools/jets/blob/35bb5a40148074ae03f03b85b16e63707df90970/lib/jets/cfn/ship.rb#L66
  # About a "Circular dependency" but the error magically went away
  # Tried reproducing many times and think it might have been an temporary edge case CloudFormation bug

  # The jets/public#show controller can serve static utf8 content out of the public folder.
  # Note, as part of the deploy process Jets uploads files in the public folder to s3
  # and serves them out of s3 directly. S3 is well suited to serve static assets.
  # More info here: https://rubyonjets.com/docs/extras/assets-serving/
  any "*catchall", to: "jets/public#show"
end
