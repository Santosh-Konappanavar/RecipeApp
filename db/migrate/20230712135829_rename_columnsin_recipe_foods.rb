# frozen_string_literal: true

class RenameColumnsinRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    rename_column :recipe_foods, :foods_id, :food_id
    rename_column :recipe_foods, :recipes_id, :recipe_id
  end
end
