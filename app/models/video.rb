class Video < ApplicationRecord
    has_one_attached :thumbnail
    has_many :enrollments
    has_many :users, through: :enrollments
end
