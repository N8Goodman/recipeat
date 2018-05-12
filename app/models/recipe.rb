class Recipe < ApplicationRecord
  enum season: [:spring, :summer, :fall, :winter]
  enum type: [:chicken, :beef, :pork, :fish, :vegetarian]

  has_many :ingredients
end
