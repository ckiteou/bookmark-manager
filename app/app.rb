ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  get '/links' do
    # This uses DataMapper's .all method to fetch all
    # data pertaining to this class from the database
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  get '/tags/:name' do
    @all_links = Link.all
    @links = []
    @all_links.each { |link| link.tags.each { |tag| @links << link if tag.name == params[:name] } }
    erb(:'links/index')
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title]) # 1. Create a link
    tag = Tag.first_or_create(name: params[:tags]) # 2. Create a tag for the link
    p params
    link.tags << tag
    link.save
    redirect to '/links'
  end

  run! if app_file == $0
end
