class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  SUPPORTED_LANGUAGES = ["English", "Arabic", "French", "SPanish", "Portuguese"].freeze

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :language, inclusion: {in :SUPPORTED_LANGUAGES}

end
