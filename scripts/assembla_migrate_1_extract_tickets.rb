#!/usr/bin/env ruby
# References
# -- https://www.twilio.com/blog/5-ways-make-http-requests-ruby
# -- https://www.rubyguides.com/2019/01/ruby-environment-variables/
# -- https://github.com/augustl/net-http-cheat-sheet/blob/master/headers.rb

require 'uri'
require 'net/http'
require 'json'

@assembla_api_key = ENV['ASSEMBLA_API_KEY']
@assembla_api_secret = ENV['ASSEMBLA_API_SECRET']
assembla_base_uri = 'https://api.assembla.com/v1'

def clean_up(file)
  file.close
end

def assembla_get_request(url, params=nil)
  # Work within rate limits
  # 240 requests per minute with burst of 20 requests per second

  uri = URI.parse(url)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(uri.request_uri)
  request['X-Api-Key'] = @assembla_api_key
  request['X-Api-Secret'] = @assembla_api_secret

  response = http.request(request)

  response
end

# Get the list of Assembla spaces
spaces_json = assembla_get_request("#{assembla_base_uri}/spaces.json")
exit unless spaces_json.is_a?(Net::HTTPSuccess)

# https://api-docs.assembla.cc/content/ref/spaces_index.html
# 'GET /v1/spaces (200 OK, 204 No Content, 404 Not Found)'

# Present list of Assembla spaces to user
spaces = JSON.parse spaces_json.body
print "Choose an Assembla space to export:\n\n"

spaces.each_with_index do |space, i|
  puts "#{i + 1}. #{space['name']}"
end

# Prompt to select one, confirm / loop
answer = 0
while answer < 1 || answer > spaces.length
  print "\nEnter the number of the space to export (1 - #{spaces.length}): "
  answer = gets.chomp.to_i
end

puts "\nQuery the tickets in space: '#{spaces[answer - 1]['name']}'"

space_id = spaces[answer - 1]['id']
output_file_name = "#{spaces[answer - 1]['name']}.csv"

# Iterate through page of issues (10 at a time)
# https://api-docs.assembla.cc/content/ref/tickets_index.html
# 'GET /v1/spaces/:space_id/tickets (200 OK, 204 No Content, 404 Not Found)'

# Get the list of Assembla spaces
tickets_json = assembla_get_request("#{assembla_base_uri}/spaces/#{space_id}/tickets.json?report=2&sort_by=number&page=1")
exit unless tickets_json.is_a?(Net::HTTPSuccess)

# Present list of Assembla spaces to user
tickets = JSON.parse tickets_json.body

# Open the output file
output_file = File.open(output_file_name, 'w')
expected_number = 1
output_file_text = "number,title,description,status\n"
tickets.each_with_index do |ticket, i|
  if ticket['number'].to_i != expected_number
    puts "Tickets are not sequential.  Check index #{i}: expected #{expected_number}, got #{ticket['number'].to_i}"
    clean_up(output_file)
    exit
  end
  # Extract ID, Title, Description (not sure about description - just create a hyperlink to the Assembla issue)
  output_file_text << "#{ticket['number']},\"#{ticket['summary']}\","
  output_file_text << "\"#{ticket['description']}\",\"#{ticket['status']}\"\n"
  
  expected_number += 1
end

output_file.write(output_file_text)
clean_up(output_file)
puts 'Processing completed!'
