require 'faker'

voteable_stuff = []

100.times do |x|
  User.create(name: Faker::Internet.user_name, email: Faker::Internet.email,
  hashed_password: Faker::Internet.password)
end

counter = 1
100.times do |x|
  q = Question.create!(content: Faker::Hacker.say_something_smart, title: Faker::Book.title,
   user_id: counter)
  counter += 1
  voteable_stuff << q
end


comment_id = 1
100.times do |x|
  c = Comment.create!(content: Faker::Hacker.say_something_smart, commentable_id: comment_id)
  comment_id += 1
  voteable_stuff << c
end

answer_counter_user = 1
comment_counter_answer = 1
100.times do |x|
  a = Answer.create!(content: Faker::Hacker.say_something_smart, user_id: answer_counter_user,
  question_id: comment_counter_answer)
  answer_counter_user += 1
  comment_counter_answer += 1
  voteable_stuff << a
end

vote_id = 1
100.times do
  Vote.create!(voteable_id: vote_id, voteable_type: voteable_stuff.sample.class)
  vote_id += 1
end
