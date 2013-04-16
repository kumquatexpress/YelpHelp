class StaticController < ApplicationController

	def home
		render("public/index.html")
	end

end
