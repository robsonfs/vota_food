class CreatePratos < ActiveRecord::Migration
  def change
    create_table :pratos do |t|
      t.string :nome, null: false
      t.index :nome, unique: true

      t.timestamps null: false
    end
  end
end
