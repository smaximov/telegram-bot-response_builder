# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Telegram::Bot::ResponseBuilder do
  subject { described_class.new }

  it 'builds a response hash for known API methods' do
    payload = { chat_id: 42, text: 'Look, Ma! no requests!' }
    response = subject.send_message(payload)

    expect(response).to eq(payload.merge(method: 'sendMessage'))
  end
end
