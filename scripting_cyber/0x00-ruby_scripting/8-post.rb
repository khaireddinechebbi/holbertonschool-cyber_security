require 'net/http'
require 'json'
require 'uri'

def post_request(url, body_params)
    uri = URI(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme == 'https'

    request = Net::HTTP::Post.new(uri.path, {
        'Content-Type' => 'application/json'
    })
    request.body = body_params.to_json

    response = http.request(request)

    puts "Response status: #{response.code} #{response.message}"
    puts "Response body:"
    puts JSON.pretty_generate(JSON.parse(response.body))
end