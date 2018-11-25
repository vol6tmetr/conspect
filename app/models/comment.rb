class Comment < ApplicationRecord
  belongs_to :conspect
  validates :content, presence: true, length: { maximum: 250 }

  acts_as_votable

  searchable do
    text :content
  end
end
