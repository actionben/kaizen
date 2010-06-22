require 'rubygems'
require 'sinatra'
require 'haml'
require 'maruku'

get '/' do
  haml :index
end

get '/about_us' do
  haml :about_us
end

get '/stylesheets/main.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :'stylesheets/main'
end

get '/aboutus' do
  redirect '/about_us', 301
end

get '*.*' do
  redirect "#{params[:splat].first}", 301
end
