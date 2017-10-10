require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require_relative 'lib/cookbook'
require_relative 'lib/controller'
require_relative 'lib/router'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

csv_file    = File.join(__dir__, 'lib/recipes.csv')
cookbook    = Cookbook.new(csv_file)
controller  = Controller.new(cookbook)
router      = Router.new(controller)


get '/' do
  @cookbook = cookbook
  erb :index
end

get '/about' do
  erb :about
end

get '/add' do
  erb :add
end

get '/remove' do
  erb :remove
end

get '/import' do
  erb :import
end
