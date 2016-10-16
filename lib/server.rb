require 'sinatra'
set :server, 'thin'

get '/' do
	halt erb(:write)
end

get '/message' do
	halt 'ok'
end

post '/' do
	halt 'ok'
end

__END__

@@ layout
<html>
	<head>
		<title>test task</title>
		<meta charset="utf-8" />
		<link rel="stylesheet" href="input.css">
		<script type="text/javascript" src="http://cryptojs.altervista.org/api/functions_cryptography.js"></script>
		<script src="script.js"></script>
	</head>
	<body><%= yield %></body>
</html>

@@ write
	<form onsubmit="s(this);return false;">
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
