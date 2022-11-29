class HelloController < ApplicationController
	8.times do |i|
		define_method "hello#{i}" do
			render plain: "ok#{i}"
		end
	end
end
