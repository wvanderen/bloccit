require 'random_data'

5.times do 
    User.create!(
        name: RandomData.random_name,
        email: RandomData.random_email,
        password: RandomData.random_sentence
        )
    end
    users = User.all

15.times do
    Topic.create!(
        name:           RandomData.random_sentence,
        description:    RandomData.random_paragraph
        )
end
topics = Topic.all

50.times do
    post = Post.create!(
        user: users.sample,
        topic: topics.sample,
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
        )
        
        post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
        rand(1..5).times { post.votes.create!(value: [-1,1].sample, user: users.sample) }
end


Post.find_or_create_by(
    title: "Unique Title",
    body: "Unique Body"
    )

50.times do
    Question.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph,
        resolved: rand(0..1)
        )
end


Question.find_or_create_by(
    title: "Unique Title",
    body: "Unique Body",
    resolved: false
    )

10.times do
    Advertisement.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph,
        price: rand(1..100)
        )
end

Advertisement.find_or_create_by(
    title: "Unique Title",
    body: "Unique Body",
    price: 1
    )


posts = Post.all

100.times do
    Comment.create!(
        user: users.sample,
        post: posts.sample,
        body: RandomData.random_paragraph
        )
end

Comment.find_or_create_by(
    post: posts.find_or_create_by(title: "Unique Title"),
    body: "Unique comment body"
    )
    
admin = User.create!(
    name: 'Admin User',
    email: 'admin@example.com',
    password: 'helloworld',
    role: 'admin'
    )
    
member = User.create!(
    name: 'Member User',
    email: 'member@example.com',
    password: 'helloworld'
    )

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"
puts "#{Question.count} questions created"
puts "#{Vote.count} votes created"