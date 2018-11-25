class User < ApplicationRecord
  UNRANSACKABLE_ATTRIBUTES = %w(id created_at)
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :conspects, dependent: :destroy

  acts_as_voter

  ratyrate_rater

  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end

  paginates_per 10
end
