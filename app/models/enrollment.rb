class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :video

  validates :progress, numericality: {
    greater_than_or_equal_to: 0.0,
    less_than_or_equal_to: 1.0
  }, allow_nil: true
end
