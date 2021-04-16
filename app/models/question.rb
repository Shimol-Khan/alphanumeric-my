class Question < ApplicationRecord
  belongs_to :user
  validates_presence_of :title, allow_blank: false
end
