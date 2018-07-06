# Faraday::RaiseErrors

Faraday middleware that raises exceptions for HTTP errors in the 400..599 range.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "faraday-raise-errors"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install faraday-raise-errors

## Usage

```ruby
connection = Faraday.new
connection.use Faraday::RaiseErrors
```

## Contributing

1. Fork it ( https://github.com/boblail/faraday-raise_errors/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
