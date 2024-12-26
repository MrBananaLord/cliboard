class AddCodeToContributions < ActiveRecord::Migration[8.0]
  def change
    add_column :contributions, :code, :string
    add_index :contributions, :code, unique: true
  end
end
