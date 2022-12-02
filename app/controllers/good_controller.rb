class GoodController < ApplicationController
  100.times do |i|
    define_method "index#{i}" do
      render plain: "good#{i}"
    end
  end
end
