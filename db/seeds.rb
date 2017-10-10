require 'random_data'

50.times do
    Post.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
        )
end


Post.find_or_create_by(
    title: "Unique Title",
    body: "Unique Body"
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
        post: posts.sample,
        body: RandomData.random_paragraph
        )
end

Comment.find_or_create_by(
    post: posts.find_or_create_by(title: "Unique Title"),
    body: "Unique comment body"
    )

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"