require 'rubygems'
require 'sinatra'

enable :sessions
set :session_secret, '*&(^B234'

get '/' do
  if (session["cont"].nil?) 
  	session["cont"] ||= 0   
  end
   <<-HTML  
      <h1>Mi cuenta es: #{session["cont"]}</h1>
	  <form action="/incrementa" method="post">
		<input type="submit" value="Suma!"></input>
	  </form>
	HTML
end

post '/incrementa' do
   incremento = session["cont"].to_i + 1
   session["cont"] = incremento
   redirect '/'
end