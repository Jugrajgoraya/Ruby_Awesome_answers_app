# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# To run seeds, do:
 # rails db:seed

 Answer.delete_all 
 Question.delete_all
 
 NUM_QUESTION = 200
 
 NUM_QUESTION.times do 
     created_at = Faker::Date.backward(days: 365 * 5)
     q = Question.create(
         title: Faker::Hacker.say_something_smart,
         body: Faker::ChuckNorris.fact,
         created_at: created_at,
         updated_at: created_at
     )
     if q.valid? 
         q.answers = rand(0..10).times.map do 
             Answer.new(body: Faker::GreekPhilosophers.quote)
         end
     end
 end
 
 question = Question.all 
 answer = Answer.all
 
 puts Cowsay.say("Generated #{question.count} questions", :frogs)
 puts Cowsay.say("Generated #{answer.count} answers", :tux)