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

    def chat(msg, user_name = nil)
      params = {
        message:   msg,
        user_name: user_name,
      }
      response("chat", params)
    end

    def character(msg, character_type = nil)
      params = {
        message:        msg,
        character_type: character_type,
      }
      response("character", params)
    end

    def name(name)
      params = { message: name }
      response("name", params)
    end

    def decompose(text, detail = false, cut_last_word = false)
      params = {
        message:       text,
        detail:        detail,
        cut_last_word: cut_last_word,
      }
      response("decompose", params)
    end

    private
    def response(type, params)
      params[:key] = @access_token
      params       = URI.encode_www_form(params)
      rest         = RestClient.get("#{DEFAULT_URL}/#{type}?#{params}")
      result       = JSON.parse(rest)

      result
    end
  end
end
