# frozen_string_literal: true

# Migration to create the Recipes table.

class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      # Define your table columns here
      t.string :name
      t.integer :preparation_time
      t.integer :cooking_time
      t.string :description
      t.boolean :public
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
