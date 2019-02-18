require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require_relative 'lib/cookbook'
require_relative 'lib/recipe'
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

New_cookbook = Cookbook.new('lib/recipes.csv')

get '/' do
  erb :home
end

get '/recipes' do
  erb :recipes
end

get '/Tiramisu%20aux%20fraises%20(20%20min)' do
  "Hello World"
end
