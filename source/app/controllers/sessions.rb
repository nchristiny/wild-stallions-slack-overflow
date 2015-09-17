get '/sessions' do
  erb :"/sessions"
end

 get '/sessions/login' do
   erb :"/sessions/login"
 end

post '/sessions/new' do
  @user = User.find_by(email: params[:user][:email])
  if User.authenticate(params[:user][:email], params[:user][:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @error = ""
    erb :'/sessions/login'
  end
end

get '/sessions/logout' do
  session.delete(:user_id)
  redirect "/"
end
