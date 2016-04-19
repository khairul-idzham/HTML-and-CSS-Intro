require 'byebug'

get '/' do
	puts "[LOG] Getting /"
	puts "[LOG] Params #{params.inspect}"
  erb :"layouts/application"
end

post '/urls' do
	@url = Url.create(long_url: params[:long_url])
	@url.shorten
	@url.save
	erb :"layouts/application"
end

get '/:short_url' do
	url = Url.find_by(short_url: params[:short_url])
	count = url.counter.to_i
	count += 1
	url.counter = count
	url.save

	redirect to('http://' + url.long_url)
end



# <!-- 	<% unless @url.nil? %> 
# 	<p> You have inluded <%= @url.long_url %> into the database. </p>
# 	<p> Your short URL:<a href="<%= @url.short_url %>"><%=@url.short_url %></a></p>
# 	<% end %> -->