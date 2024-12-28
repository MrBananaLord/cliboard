class AddTextToReactions < ActiveRecord::Migration[8.0]
  def change
    add_column :reactions, :text, :text
  end
end
