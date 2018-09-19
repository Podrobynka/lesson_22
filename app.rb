require 'rubygems'
require 'sinatra'
# require 'sinatra/reloader'

get '/' do
  erb 'Can you handle a?'
end

get '/about' do
  erb :about
end

get '/visit' do
  erb :visit
end

post '/visit' do
  @username = params[:username]
  @phone = params[:phone]
  @datetime = params[:datetime]

  @title = 'Thank you!'
  @message = "Dear #{@username}, we'll waiting for you at #{@datetime}."
  f = File.open('public/users.txt', 'a')
  f.write "\nUser: #{@username}. Phone: #{@phone}. Date and time: #{@datetime}"
  f.close
end

get '/contacts' do
  erb :contacts
end

post '/contacts' do
  @email = params[:email]
  @text = params['text']

  f = File.open('public/contacts.txt', 'a')
  f.write "\n#{@email} - #{@text}"
  f.close
end
