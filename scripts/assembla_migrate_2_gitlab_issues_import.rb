#!/usr/bin/env ruby

gitlab_personal_access_token = ENV['GITLAB_PERSONAL_ACCESS_TOKEN']
gitlab_base_uri = 'http://hotel-test.equalexperts.io'

uri = URI("#{gitlab_base_uri}/booking")
header = { 'PRIVATE-TOKEN': gitlab_personal_access_token }
projects_json = Net::HTTP.get_response(uri, header)
exit unless projects_json.is_a?(Net::HTTPSuccess)
