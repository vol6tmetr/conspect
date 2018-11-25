class Conspect < ApplicationRecord
  belongs_to :user, class_name: User.name, foreign_key: :user_id
  has_many :comments, dependent: :destroy

  validates :title,presence: true, length: { maximum: 50}
  validates :description,presence: true, length: { maximum: 80}
  validates :speciality_number,presence: true, length: { maximum: 15}
  validates :content, presence: true

  searchable do
    text :title, :default_boost => 2
    text :content
  end

  ratyrate_rateable "rating"

  paginates_per 10
end
