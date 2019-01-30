class Book < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :author
  validates_presence_of :pages
  validates_presence_of :published
end
