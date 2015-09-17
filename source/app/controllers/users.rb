get '/users/new' do
  erb :"/users/new"
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    redirect "/users/#{@user.id}"
  else
    redirect '/users/new'
  end
end

get '/users/:id' do
  erb :"users/show"
end
