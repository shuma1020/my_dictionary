class Manage < ApplicationRecord
  belongs_to :genre
  belongs_to :post
  belongs_to :project
end
