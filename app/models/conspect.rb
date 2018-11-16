class Conspect < ApplicationRecord
  belongs_to :user, class_name: User.name, foreign_key: :user_id
end
