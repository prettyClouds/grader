
# myapp.rb
require 'rubygems'
require 'sinatra'
require 'haml'
require './ProgramChecker'

get '/' do
  haml :index
end

get '/labs/:lab' do
	haml :lab
end

post '/labs/:lab' do

  file_to_save = "./uploads/#{Time.now.to_i}-#{params['file'][:filename]}"

  open(file_to_save, "w") do |f|
    f.write(params['file'][:tempfile].read)
  end

  results = ProgramChecker.new(file_to_save, params[:lab]).run
  haml :results, :locals => {:results => results}
  
end
