class Video < ApplicationRecord
    has_one_attached :thumbnail
    has_one_attached :video_file

    has_many :enrollments, dependent: :destroy
    has_many :users, through: :enrollments

    def self.search(query)
        where(
            "title ILIKE :query OR description ILIKE :query",
            query:"%#{sanitize_sql_like(query)}%"
        )
    end
end
