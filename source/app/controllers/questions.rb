get '/questions' do
  erb :'/questions/index'
end

# WORKING ON THIS ROUTE TO QUESTIONS/NEW
get '/questions/new' do
  erb :'/questions/new'
end

post '/questions' do
	@question = Question.create(params[:question])
	params[:topic].each do |topic_id|
	  Tag.create(question_id: @question.id, topic_id: topic_id.to_i)
	end
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
  @tags = Tag.all.where({question_id: @question.id})
  if @comments = Comment.where({commentable_id: @question.id})
  end
  erb :'/questions/show'
end

post '/questions/:query' do
  redirect "/questions/search/#{params[:params][:query]}"
end

post '/comments' do
  @question = Question.find_by(id: params[:question_id])
  @tags = Tag.all.where({question_id: @question.id})
  @comment = Comment.create(params[:comment])
  if request.xhr?
    @comment.content
  else
    erb :'/questions/show'
  end
end
