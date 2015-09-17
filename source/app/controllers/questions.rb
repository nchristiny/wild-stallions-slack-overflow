get '/questions' do
  erb :'/questions/index'
end

# WORKING ON THIS ROUTE TO QUESTIONS/NEW
get '/questions/new' do
  erb :'/questions/new'
end

post '/questions' do
	user = User.find_by(id: session[:user_id])
	@question = Question.new(user_id: user.id, content: params[:question_content])
  redirect to "/questions/#{@question.id}"
end

get '/questions/search' do
  erb :"questions/search"
end

get '/questions/search/:query' do
  @query = params[:query]
  tag = Tag.find_by(name: @query)
  searched_question_id = tag.question_id
  @questions = Question.where({ id: searched_question_id })
  erb :'/questions/query'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'/questions/show'
end

post '/questions/:query' do
  redirect "/questions/search/#{params[:params][:query]}"
end
