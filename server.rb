require 'sinatra'
require_relative 'lib/storage'
set :server, 'thin'

messages = Storage.new

get '/' do
	halt erb(:write)
end

get '/:path' do
	halt erb :message_page,:locals => { :message => messages.get(params['path']).read} if messages.get(params['path'])
	redirect to('/')
end

post '/' do
	hh = params['hh'].to_i#hours
	mm = params['mm'].to_i#minutes
	ss = params['ss'].to_i#seconds
	message_string = params['message']
	limit = params['limit'].to_i if params['limit'] != ''#views limit
	time = ss + mm*60 + hh*60*60
	time = nil if time == 0

	key = messages.push Message.new(message_string, {:number_of_visits => limit, :life_time => time})

	erb :safe_link, :locals => { :link => "<a href='#{request.base_url+'/'+key}'>#{request.base_url+'/'+key}</a>"}
end

__END__

@@ layout
<html>
	<head>
		<title>test task</title>
		<meta charset="utf-8" />
		<link rel="stylesheet" href="input.css">
		<script type="text/javascript" src="crypto.js"></script>
		<script src="script.js"></script>
	</head>
	<body><%= yield %></body>
</html>

@@ write
	<form onsubmit="s(this);return false;" method="post">
		<h2>Write a message</h2>
		<textarea id="message" name="message"></textarea>
		<div id='inputs'>
			<div id="lifetime">
				<h3>Lifetime</h3>
				<input id="hh" type="number" name="hh" min="0" max="24"> hh</input><br>
				<input id="mm" type="number" name="mm" min="0" max="59"> mm</input><br>
				<input id="ss" type="number" name="ss" min="0" max="59"> ss</input>
			</div>
			<div id="views-limit">
				<h3>Views limit</h3>
				<input id="limit" type="number" name="limit" min="0"></input>
				<h3>Secret</h3>
				<input id="secret" type="text" name="secret"></input>
			</div>
			<div>
				<input id="submit" type="submit"></input>
		  	</div>
		</div>
		<span id="info"></span>
	</form>
@@ safe_link
	<h2>Link to your message</h2>
	<%= link %>

@@ message_page
	<div class="center">
		<div id="message_block">
			<h2>Your message</h2>
			<span id="pwd_info">add your password to decode it</span>
			<p id="message_view"><%= message %></p>
		</div>
		<form onsubmit="decrypt();return false">
			<input id="secret" type="text" name="secret"></input>
			<input value="Decode" type="submit"></input>
		</form>
	</div>

@@ oops
	<h2>Your message not found</h2>
