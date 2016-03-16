require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

require 'color'

RSpec.configure do |config|
  config.mock_with :rspec
  config.color = true
end
