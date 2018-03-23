class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :commented_users, through: :comments, source: :user
  validates :body, presence: true, length: { maximum: 140 }
  acts_as_votable

end
