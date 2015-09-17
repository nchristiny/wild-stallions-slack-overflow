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
  @user = User.find(params[:id])
  @user_questions = @user.questions
  @user_comments = @user.comments
  erb :"users/show"
end

get '/users' do
  @users = User.all
  erb :"users/users"
end
