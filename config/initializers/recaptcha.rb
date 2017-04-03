require 'bundler/setup'
require 'sinatra'
require 'recaptcha'

# these will only work on localhost ... make your own at https://www.google.com/recaptcha
Recaptcha.configure do |config|
  config.public_key  = '6LfmdRoTAAAAAFJkaQHoZ4If8J756audgGtaVFsr'
  config.private_key = '6LfmdRoTAAAAAIHzS9uneBlzFCxekConpp6Na-y3'
end

include Recaptcha::ClientHelper
include Recaptcha::Verify

get '/' do
  <<-HTML
    <form action="/verify">
      #{recaptcha_tags}
      <input type="submit"/>
    </form>
  HTML
end

get '/verify' do
  if verify_recaptcha
    'YES!'
  else
    'NO!'
  end
end