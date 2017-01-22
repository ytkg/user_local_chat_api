require "user_local_chat_api/version"
require 'uri'
require 'rest-client'
require 'json'

module UserLocalChatApi
  class Client
    DEFAULT_URL = 'https://chatbot-api.userlocal.jp/api'

    def initialize(access_token = nil)
      @access_token = access_token || ENV['USER_LOCAL_ACCESS_TOKEN']
    end

    def chat(msg)
      url = "#{DEFAULT_URL}/chat?key=#{@access_token}&message=#{msg}"
      response(url)
    end

    def character(msg, character_type = nil)
      url = "#{DEFAULT_URL}/character?key=#{@access_token}&message=#{msg}&character_type=#{character_type}"
      response(url)
    end

    def name(name)
      url = "#{DEFAULT_URL}/name?key=#{@access_token}&message=#{name}"
      response(url)
    end

    def decompose(msg)
      url = "#{DEFAULT_URL}/decompose?key=#{@access_token}&message=#{msg}"
      response(url)
    end

    private
       def response(url)
         url_escape = URI.escape(url)
         rest       = RestClient.get(url_escape)
         result     = JSON.parse(rest)

         result
       end

  end
end
