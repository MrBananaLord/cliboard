class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.references :board, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
