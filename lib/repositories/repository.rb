require 'net/http'
require 'rexml/document'
require 'uri'
require_relative 'albums_repository'
require_relative 'photos_repository'
require_relative 'tags_repository'

module PicasaWebAlbums
  class Repository
    include AlbumsRepository
    include PhotosRepository
    include TagsRepository
    
    def initialize(email, password)
      @email = email
      @authentication_token = get_authentication_token(email, password)
    end

    private
    
    def get_xml(url)
      uri = URI(url)
      request = Net::HTTP::Get.new(uri.request_uri)
      request['Authorization'] = @authentication_token
      response = Net::HTTP.start(uri.hostname, uri.port) do |http| 
        http.request(request) 
      end
      REXML::Document.new(response.body)
    end

    def get_authentication_token(email, password)
      uri = URI("https://www.google.com/accounts/ClientLogin")
      body = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
        request = Net::HTTP::Post.new uri.request_uri
        data = "accountType=HOSTED_OR_GOOGLE&Email=#{email}&Passwd=#{password}&service=lh2&source=someapp1"
        response = http.request(request, data)
        response.body
      end
      "GoogleLogin #{token_string_request_body(body)}"
    end

    def token_string_request_body(body)
      start_index = body.index('Auth=')
      slice_of_auth_to_end = body[start_index..-1]
      end_index = slice_of_auth_to_end.index("\n")
      auth_string = slice_of_auth_to_end[0...end_index]
    end
  end
end