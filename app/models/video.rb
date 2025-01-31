class Video < ApplicationRecord
    has_one_attached :thumbnail
    has_one_attached :video_file

    has_many :enrollments, dependent: :destroy
    has_many :users, through: :enrollments
end
