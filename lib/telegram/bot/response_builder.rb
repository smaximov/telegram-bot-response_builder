# frozen_string_literal: true

require 'telegram/bot'

module Telegram
  module Bot
    # {Telegram::Bot::Api} subclass that builds response hashes
    # instead of making Telegram API requests.
    #
    # @example
    #   response_builder = Telegram::Bot::ResponseBuilder.new
    #   response_builder.send_message(chat_id: 42, text: 'Look, Ma! No requests!')
    #   # {:chat_id=>42, :text=>"Look, Ma! No requests!", :method=>"sendMessage"}
    class ResponseBuilder < Api
      VERSION = '0.1.0'

      def initialize; end

      def call(endpoint, raw_params = {})
        build_params(raw_params.merge(method: endpoint))
      end
    end
  end
end
