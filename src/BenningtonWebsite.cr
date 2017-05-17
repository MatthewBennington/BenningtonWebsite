require "./BenningtonWebsite/*"
require "kemal"

get "/" do
	if (5..10).includes? Time.now.month
		next_term = "Fall#{Time.now.year}"
	else
		next_term = "Spring#{Time.now.year + 1}"
	end
	curriculum_link = "http://curriculum.bennington.edu/#{next_term}/"
	render "src/views/index.html.ecr"
end

get "/map.pdf" do |env|
	# TODO Figure out why this isn't working, there is a post up on SO.
	env.response.headers["Content-Type"] = "application/pdf"
	env.response.headers["Content-Disposition"] = %(inline;filename="myfile.pdf")
end

Kemal.run
