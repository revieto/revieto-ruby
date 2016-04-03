$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

# External
require 'rubygems'
require 'rspec'
require 'pry'
require 'webmock/rspec'
require 'forgery'

require 'coveralls'
Coveralls.wear!

# Library
require 'reviews_catcher'

def test_api_rating(name='Sample account name')
  {
    'account_name' => name,
    'aggregate_rating' => rand(0.0...5.0).round(2),
    'rating_count' => rand(1...50)
  }
end

def test_api_reviews(name='Sample account name')
  {
    'account_name' => name,
    'aggregate_rating' => rand(0.0...5.0).round(2),
    'rating_count' => rand(1...50),
    'reviews' => [
      {
        'id' => 0,
        'created_at' => DateTime.now,
        'updated_at' => DateTime.now,
        'rating' => rand(0.0...5.0).round(2),
        'name' => Forgery('name').full_name,
        'profile_picture_url' => 'http://placehold.it/200x200',
        'profile_picture_color' => '#000000',
        'provider' => %w(facebook google yelp survey)[rand(0...3)],
        'external_provider' => true,
        'comment' => Forgery(:lorem_ipsum).paragraph
      },
      {
        'id' => 1,
        'created_at' => DateTime.now,
        'updated_at' => DateTime.now,
        'rating' => rand(0.0...5.0).round(2),
        'name' => Forgery('name').full_name,
        'profile_picture_url' => 'http://placehold.it/200x200',
        'profile_picture_color' => '#000000',
        'provider' => %w(facebook google yelp survey)[rand(0...3)],
        'external_provider' => true,
        'comment' => Forgery(:lorem_ipsum).paragraph
      },
      {
        'id' => 2,
        'created_at' => DateTime.now,
        'updated_at' => DateTime.now,
        'rating' => rand(0.0...5.0).round(2),
        'name' => Forgery('name').full_name,
        'profile_picture_url' => 'http://placehold.it/200x200',
        'profile_picture_color' => '#000000',
        'provider' => %w(facebook google yelp survey)[rand(0...3)],
        'external_provider' => true,
        'comment' => Forgery(:lorem_ipsum).paragraph
      }
    ]
  }
end

# Stub

def stub_rating_request(client, request_response, status_code=200)
  stub_request(:get, "#{client.base_url}/api/v1/rating").
    with(:headers => {'Authorization'=>"api_key=#{client.api_key}"}).
    to_return(:status => status_code, :body => request_response.to_json,
              headers: {'Content-Type' => 'application/json'})
end

def stub_reviews_request(client, request_response, status_code=200)
  stub_request(:get, "#{client.base_url}/api/v1/reviews").
    with(:headers => {'Authorization'=>"api_key=#{client.api_key}"}).
    to_return(:status => status_code, :body => request_response.to_json,
              headers: {'Content-Type' => 'application/json'})
end