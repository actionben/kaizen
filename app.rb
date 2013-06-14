require 'sinatra'
require 'haml'
require 'maruku'
require 'sass'
  
configure :development do
  set redirect: false
end
  
configure :production do
  set redirect: true
end

before do
  if settings.redirect && request.host != 'www.kaizeninternet.com'
    redirect "http://www.kaizeninternet.com"+request.fullpath, 301
  end
end


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
