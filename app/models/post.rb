class Post < ActiveRecord::Base
  validates :title, :author, :url, presence: true
  validates :title, :author, :url, length: { minimum: 2 }
end
