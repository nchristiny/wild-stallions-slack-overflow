get '/questions' do
  erb :'/questions/index'
end

# WORKING ON THIS ROUTE TO QUESTIONS/NEW
get '/questions/new' do
  erb :'/questions/new'
end

post '/questions' do
	@question = Question.create(params[:question])
	p "*******************"
	p params[:name]
	p "*******************"
	params[:topic].each do |topic_id|
	  Tag.create(question_id: @question.id, topic_id: topic_id.to_i, name: params[:name] )
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
  # tags = []
  # tags << Tag.find_by(:all, question_id: question.id)
  # topics = []
  
  erb :'/questions/show'
end

post '/questions/:query' do
  redirect "/questions/search/#{params[:params][:query]}"
end
