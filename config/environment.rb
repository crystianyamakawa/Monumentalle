# Load the Rails application.
require File.expand_path('../application', __FILE__)
Rails.root.join('app', 'assets', 'images', 'logo.png')

# Initialize the Rails application.
Rails.application.initialize!
require 'brazilian-rails'
require 'will_paginate'
