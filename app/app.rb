ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'data_mapper_setup'
require_relative 'server'
require_relative 'controllers/links'
require_relative 'controllers/tags'
require_relative 'controllers/sessions'
require_relative 'controllers/users'

class BookmarkManager < Sinatra::Base

  # get '/users/new' do
  #   @user = User.new
  #   erb :'users/new'
  # end
  #
  # post '/users' do
  #   @user = User.create(email: params[:email],
  #                      password: params[:password],
  #                      password_confirmation: params[:password_confirmation])
  #   if @user.save
  #    session[:user_id] = @user.id
  #    redirect to('/links')
  #   else
  #    flash.now[:errors] = @user.errors.full_messages
  #    erb :'users/new'
  #   end
  # end

  run! if app_file == $0
end
