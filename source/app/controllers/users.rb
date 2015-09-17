get '/users/new' do
  erb :"/users/new"
end

post '/users/new' do
  @user = User.new(name: user[:name], email: user[:email], password: user[:password])
  p @user.id
  p params
  p "****************************************************************"
  if @user.save
    redirect "/users/#{@user.id}"
  else
    redirect '/users/new'
  end
end

get 'users/:id' do
  "It worked!"
end
