require 'byebug'

get '/' do
  erb :"static/index"
end

post '/urls' do
	@url = Url.create(long_url: params[:long_url])
	@url.shorten
	@url.save
	erb :"static/index"
end

get '/:short_url' do
	@url = Url.find_by(short_url: params[:short_url])
	redirect to('http://' + @url.long_url)
end