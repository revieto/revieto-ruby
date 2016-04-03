# reviewscatcher-ruby

Ruby bindings for the Reviews Catcher API.

[![Build Status](https://travis-ci.org/reviewscatcher/reviewscatcher-ruby.svg?branch=master)](https://travis-ci.org/reviewscatcher/reviewscatcher-ruby)

[![Gem Version](https://badge.fury.io/rb/reviews_catcher.svg)](https://badge.fury.io/rb/reviews_catcher)

[![Coverage Status](https://coveralls.io/repos/github/reviewscatcher/reviewscatcher-ruby/badge.svg?branch=master)](https://coveralls.io/github/reviewscatcher/reviewscatcher-ruby?branch=master)

## Instalation

```ruby
gem install reviews_catcher
```

Using bundler:

```ruby
gem 'reviews_catcher'
```

## Configure your client

```
reviews_catcher = ReviewsCatcher::Client.new(app_id: 'my_app_id', api_key: 'my_api_key')
```

You can get your `app_id` and `api_key` from your account in Reviews Catcher, in the integration settings page.

## Usage

```ruby
# Find your account's aggregate rating
aggregate_rating = reviews_catcher.account.aggregate_rating

# Find your account's reviews
reviews = reviews_catcher.reviews.all
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

