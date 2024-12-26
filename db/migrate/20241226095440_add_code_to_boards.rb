class AddCodeToBoards < ActiveRecord::Migration[8.0]
  def change
    add_column :boards, :code, :string
    add_index :boards, :code, unique: true
  end
end
