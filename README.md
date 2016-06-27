# revieto-ruby

Ruby bindings for the Revieto API.

[![Build Status](https://travis-ci.org/revieto/revieto-ruby.svg?branch=master)](https://travis-ci.org/revieto/revieto-ruby)

[![Gem Version](https://badge.fury.io/rb/revieto.svg)](https://badge.fury.io/rb/revieto)

[![Coverage Status](https://coveralls.io/repos/github/revieto/revieto-ruby/badge.svg?branch=master)](https://coveralls.io/github/revieto/revieto-ruby?branch=master)

## Instalation

```ruby
gem install revieto
```

Using bundler:

```ruby
gem 'revieto'
```

## Configure your client

```
revieto = Revieto::Client.new('my_api_key')
```

You can get your `api_key` from your account in Revieto in the integration settings page.

## Usage

```ruby
# Find your account's aggregate rating
aggregate_rating = revieto.account.aggregate_rating

# Find your account's reviews
reviews = revieto.reviews.all
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

