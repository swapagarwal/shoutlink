require 'dm-core'
require 'dm-timestamps'

DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://postgres:postgres@localhost/mydb')

class Link
  include DataMapper::Resource

  property :id         , String, key: true
  property :original   , Text, format: :url
  property :created_at , DateTime
  property :updated_at , DateTime
end

DataMapper.finalize.auto_upgrade!

get '/api/view/:id' do
  Link.get(params[:id]).original
end

get '/api/open/:id' do
  redirect Link.get(params[:id]).original
end

get '/api/create' do
  url = params[:url]
  key = Haikunator.haikunate(0)
  link = Link.new id: key, original: url
  link.save
  key
end

