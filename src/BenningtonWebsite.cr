require "./BenningtonWebsite/*"
require "kemal"

get "/" do
	if Time.now.month === (5..10)
		next_term = "Fall#{Time.now.year}"
	else
		next_term = "Spring#{Time.now.year + 1}"
	end
	curriculum_link = "http://curriculum.bennington.edu/#{next_term}/"
	render "src/views/index.html.ecr"
end

Kemal.run
