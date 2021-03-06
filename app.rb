#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

configure do
	@db = SQLite3::Database.new 'barbershop.db'
	@db.execute 'CREATE TABLE IF NOT EXISTS
		"Users" 
		(
			"id" INTEGER PRIMARY KEY AUTOINCREMENT, 
			"username" text,
			"phone" text, 
			"datespamp" text, 
			"barber" text, 
			"color" text
		)';
end

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

post '/visit' do
	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	@color = params[:color]

# хеш
hh = {
	:username => 'Введите имя',
	:phone => 'Введите номер телефона',
	:datetime => 'Введите дату и время'
}

# для каждой пары ключ-значение 
	hh.each do |key, value|

		if params[key] == '' # если параметр пуст 
			@error = hh[key] # переменной error присвоить value из хеша hh (a value из хеша hh это сообщение об ошибке), т.е. переменной error присвоить сообщение об ошибке
			return erb :visit
		end
	end


	erb "OK, username is #{@username}, #{@phone}, #{@datetime}, #{@barber}, #{@color}"
end

get '/contacts' do
	erb :contacts
end



