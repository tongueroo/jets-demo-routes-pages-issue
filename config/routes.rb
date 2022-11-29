Jets.application.routes.draw do
  resources :posts
  root "jets/public#show"

  8.times do |i|
    # get "test#{i}", to: "posts#index"
    get "test#{i}", to: "hello#hello#{i}"
  end
  # get "test3a", to: "posts#index" # push test4 to page2

  # The jets/public#show controller can serve static utf8 content out of the public folder.
  # Note, as part of the deploy process Jets uploads files in the public folder to s3
  # and serves them out of s3 directly. S3 is well suited to serve static assets.
  # More info here: https://rubyonjets.com/docs/extras/assets-serving/
  any "*catchall", to: "jets/public#show"
end
