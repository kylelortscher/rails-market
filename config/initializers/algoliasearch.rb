require 'algoliasearch'

Algolia.init :application_id => ENV['algolia_app_id'],
             :api_key        => ENV['algolia_api_key']