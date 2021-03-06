# Download a web page and handle exception

require 'open-uri'

page = 'podcasts'
file_name = "#{page}.html"
web_page = open("http://pragprog.com/#{page}")
output = File.open(file_name, 'w')
begin
	while line = web_page.gets
	      output.puts line
	end
rescue Exception
       STDERR.puts "Failed to download page: #{page}: #{$!}"
       File.delete(file_name)
       raise
ensure
	output.close
end