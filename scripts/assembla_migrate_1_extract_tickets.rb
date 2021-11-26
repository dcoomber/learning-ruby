#!/usr/bin/env ruby
# Reference https://www.twilio.com/blog/5-ways-make-http-requests-ruby

require 'uri'
require 'net/http'
require 'json'

base_uri = 'http://hotel-test.equalexperts.io'

def clean_up(file)
  file.close
end

# Work within rate limits
# 240 requests per minute with burst of 20 requests per second

# Get the list of Assembla spaces
uri = URI("#{base_uri}/booking")
spaces_json = Net::HTTP.get_response(uri)
exit unless spaces_json.is_a?(Net::HTTPSuccess)

# https://api-docs.assembla.cc/content/ref/spaces_index.html
puts 'GET /v1/spaces (200 OK, 204 No Content, 404 Not Found)'


spaces_json = <<'JSON_STRING'
  [
    {
      "status":1,
      "updated_at":"2011-06-20T13:58:06Z",
      "public_permissions":0,
      "wiki_name":"Wiki 1",
      "name":"Space 1",
      "description":null,
      "id":"dS5eHkVWar2RUfabdgZEU1",
      "watcher_permissions":1
    },
    {
      "status":1,
      "updated_at":"2011-06-20T13:58:06Z",
      "public_permissions":0,
      "wiki_name":"Wiki 2",
      "name":"Space 2",
      "description":null,
      "id":"dS5eHkVWar2RUfabdgZEU2",
      "watcher_permissions":1
    },
    {
      "status":1,
      "updated_at":"2011-06-20T13:58:06Z",
      "public_permissions":0,
      "wiki_name":"Wiki 3",
      "name":"Space 3",
      "description":null,
      "id":"dS5eHkVWar2RUfabdgZEU3",
      "watcher_permissions":1
    }
  ]
JSON_STRING

# Present list of Assembla spaces to user
spaces = JSON.parse spaces_json
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

# Iterate through page of issues (10 at a time)
# -- When 204 no content, export to CSV for use in next process
puts "\nQuery the tickets in space: #{spaces[answer - 1]['name']}"
output_file_name = "#{spaces[answer - 1]['name']}.csv"

uri = URI("#{base_uri}/booking")
tickets_json = Net::HTTP.get_response(uri)
exit unless tickets_json.is_a?(Net::HTTPSuccess)

# https://api-docs.assembla.cc/content/ref/tickets_index.html
puts 'GET /v1/spaces/:space_id/tickets (200 OK, 204 No Content, 404 Not Found)'

tickets_json = <<'JSON_STRING'
  [
    {
      "id":1,
      "number":1,
      "assigned_to_id":null,
      "status":1,
      "status_name":"New",
      "space_id":"b89TL8MYWr4id7adbNA33N",
      "summary":"Summary 1",
      "description":"Description 1"
    },
    {
      "id":2,
      "number":2,
      "assigned_to_id":null,
      "status":1,
      "status_name":"New",
      "space_id":"b89TL8MYWr4id7adbNA33N",
      "summary":"Summary 2",
      "description":"Description 2"
    },
    {
      "id":3,
      "number":3,
      "assigned_to_id":null,
      "status":1,
      "status_name":"New",
      "space_id":"b89TL8MYWr4id7adbNA33N",
      "summary":"Summary 3",
      "description":"Description 3"
    }
  ]
JSON_STRING

tickets = JSON.parse tickets_json

# Open the output file
output_file = File.open(output_file_name, 'w')

output_file.write("number,title,description\n")

expected_number = 1
tickets.each_with_index do |ticket, i|
  if ticket['number'].to_i != expected_number
    puts "Tickets are not sequential.  Check index #{i}: expected #{expected_number}, got #{ticket['number'].to_i}"
    clean_up(output_file)
    exit
  end
  # Extract ID, Title, Description (not sure about description - just create a hyperlink to the Assembla issue)
  output_file.write("#{ticket['number']},\"#{ticket['summary']}\",\"#{ticket['description']}\"\n")
  expected_number += 1
end

clean_up(output_file)
puts 'Processing completed!'
