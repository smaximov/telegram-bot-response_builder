# Telegram::Bot::ResponseBuilder

This gem extends [telegram-bot-ruby](https://github.com/atipugin/telegram-bot-ruby) by
enabling responding to Telegram webhook requests directly in the response body. It
introduces a `Telegram::Bot::Api` subclass which builds response hash from
parameters and the method name instead of performing an HTTP request.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'telegram-bot-response_builder'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install telegram-bot-response_builder

## Usage

Create new instance of `Telegram::Bot::ResponseBuilder` and invoke any API method
on it:

``` ruby
# ...
response_builder = Telegram::Bot::ResponseBuilder.new
response_builder.deleteMessage(chat_id: chat_id, message_id: message_id)
# {:method=>"deleteMessage", :chat_id=>chat_id, :message_id=>message_id}
```

Example &mdash; webhook-based "echo" bot, built on top of Sinatra:

``` ruby
require 'sinatra'
require 'sinatra/json'

class TelegramWebhookBot < Sinatra::Base
  use Rack::PostBodyContentTypeParser
  register Sinatra::JSON

  post '/webhooks/tg' do
    message = Telegram::Bot::Types::Update.new(params).message
    response_builder = Telegram::Bot::ResponseBuilder.new
    json response_builder.send_message(chat_id: message.chat.id, text: message.text)
    # response: {"chat_id":9001,"text":"Hello, World!","method":"sendMessage"}
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/smaximov/telegram-bot-response_builder.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
