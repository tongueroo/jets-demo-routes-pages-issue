class HelloController < ApplicationController
  100.times do |i|
    define_method "index#{i}" do
      render plain: "hello#{i}"
    end
  end
end
