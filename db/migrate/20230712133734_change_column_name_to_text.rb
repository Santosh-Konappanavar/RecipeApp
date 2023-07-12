class ChangeColumnNameToText < ActiveRecord::Migration[7.0]
  def change
    change_column :recipes, :description, :text
  end
end
