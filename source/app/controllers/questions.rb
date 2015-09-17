get '/questions' do
  erb :'/questions/index'
end

# WORKING ON THIS ROUTE TO QUESTIONS/NEW
get '/questions/new' do
  erb :'/questions/new'
end

post '/questions' do
  redirect to '/questions/:id'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'/questions/show'
end
