require 'spec_helper.rb'

describe 'Test Shoutlink' do
  it 'create & view url to google.com' do
    get '/api/create?url=http://google.com'
    expect(last_response.status).to eq 201
    get '/api/view/' + last_response.body
    expect(last_response.body).to eq('http://google.com')
  end
  it 'create & open url to google.com with password' do
    get '/api/create?url=http://google.com?password=test'
    expect(last_response.status).to eq 201
    get '/api/open/' + last_response.body + '?password=test'
    expect(last_response.status).to eq 301
  end
  it 'create & open url to github.com with password incorrect' do
    get '/api/create?url=http://github.com&password=test'
    expect(last_response.status).to eq 201
    get '/api/open/' + last_response.body + '?password=tset'
    expect(last_response.status).to eq 401
  end
end
