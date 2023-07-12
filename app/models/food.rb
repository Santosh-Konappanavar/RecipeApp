class Food < ApplicationRecord
    belongs_to :user, class_name: 'User', foreign_key: 'user_id'
    has_and_belongs_to_many :recipes, join_table: :foods_recipes
  
    validates :name, presence: true
    validates :measurement_unit, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  end