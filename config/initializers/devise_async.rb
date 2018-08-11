Devise::Async.setup do |config|
  :sidekiq
  config.enabled = true
end
