# frozen_string_literal: true

# Migration to create the RecipeFoods table.

class CreateRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_foods do |t|
      t.integer :quantity
      t.references :recipes, foreign_key: true
      t.references :foods, foreign_key: true
      t.timestamps
    end
  end
end
