DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://postgres:postgres@localhost/mydb')

class Link
  include DataMapper::Resource

  property :id         , String, key: true
  property :original   , Text, format: :url, required: true
  property :password   , BCryptHash, required: false
  property :created_at , DateTime
  property :updated_at , DateTime
end

DataMapper.finalize.auto_upgrade!

get '/api/view/:id' do
  link = Link.get(params[:id])
  password = params[:password]
  if link.nil?
    halt 404
  end
  if !link.password.nil? and link.password != password
    halt 401
  end
  link.original
end

get '/api/open/:id' do
  link = Link.get(params[:id])
  password = params[:password]
  if link.nil?
    halt 404
  end
  if !link.password.nil? and link.password != password
    halt 401
  end
  redirect link.original, 301
end

get '/api/create' do
  url = params[:url]
  password = params[:password]
  begin
    key = Haikunator.haikunate(0)
    link = Link.get(key)
  end until link.nil?
  link = Link.new id: key, original: url, password: password
  if link.save
    status 201
    key
  else
    halt 422
  end
end
