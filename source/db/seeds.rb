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


comment_counter_user = 1
comment_counter_question = 1
100.times do |x|
  c = Comment.create!(content: Faker::Hacker.say_something_smart, user_id: comment_counter_user,
  question_id: comment_counter_question)
  comment_counter_user += 1
  comment_counter_question += 1
  voteable_stuff << c
end

vote_id = 1
100.times do
  Vote.create!(voteable_id: vote_id, voteable_type: voteable_stuff.sample.class)
  vote_id += 1
end

tag_topic_id = 1
tag_question_id = 1
15.times do
  Tag.create!(name: Faker::Company.buzzword, topic_id: tag_topic_id,
  question_id: tag_question_id)
  tag_topic_id += 1
  tag_question_id += 1
end
