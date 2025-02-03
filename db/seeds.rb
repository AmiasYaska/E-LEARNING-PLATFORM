# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Video.find_or_create_create!(
#     title: "Ruby on Rails",
#     author: "Amias Yaska",
#     description: "You will learn to code and be able to make web apps asap",
#     thumbnail: File.open(Rails.root.join("app/assets/images/code.jpeg"))
# )

videos = [
    {
        title: "Ruby on Rails",
        author: "Amias Yaska",
        description: "You will learn to code and be able to make web apps asap",
        thumbnail:"code.jpeg",
        video_file: "video1.mp4"
    },
    {
        title: "Salsa Dancing",
        author: "Top A",
        description: "You may learn to code and be able to make web apps asap",
        thumbnail:"code2.jpeg",
        video_file: "video1.mp4"
    },
    {
        title: "Quiz Game",
        author: "BushPig",
        description: "You will learn to code and be able to make web apps asap",
        thumbnail:"code3.jpeg",
        video_file: "video1.mp4"
    },
    {
        title: "Sunday",
        author: "BushPig",
        description: "You will learn to code and be able to make web apps asap",
        thumbnail:"code3.jpeg",
        video_file: "video1.mp4"
    },
]

videos.each do|video_data|
    Video.find_or_create_by!(title: video_data[:title]) do |video|
        video.author = video_data[:author]
        video.description = video_data[:description]
        video.thumbnail.attach(io: File.open(Rails.root.join("app/assets/images/#{video_data[:thumbnail]}")), filename: video_data[:thumbnail])
        video.video_file.attach(io: File.open(Rails.root.join("app/assets/videos/#{video_data[:video_file]}")), filename: video_data[:video_file])
    end
end
