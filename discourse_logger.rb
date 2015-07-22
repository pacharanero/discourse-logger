require 'discourse_api'
client = DiscourseApi::Client.new(ENV['DISCOURSE_ADDRESS'])
client.api_key, client.api_username = ENV['DISCOURSE_API_KEY'], ENV['DISCOURSE_API_USER']
response = client.create_post(topic_id: "#{ENV['DISCOURSE_TOPIC']}", raw: "#{ARGV[0]}")
puts "Logged: '#{ARGV[0]}' to topic ID #{ENV['DISCOURSE_TOPIC']}"

