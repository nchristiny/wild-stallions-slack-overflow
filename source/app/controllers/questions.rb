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
	p params[:topic]
	p "*******************"
	params[:topic].each do |topic_id|
	  Tag.create(question_id: @question.id, topic_id: topic_id.to_i)
	end
  redirect to "/questions/#{@question.id}"

end

get '/questions/:id' do
  @question = Question.find(params[:id])
  tags = []
  tags << Tag.find(:all, question_id: @question.id)
  topics = []
  
  erb :'/questions/show'
end
