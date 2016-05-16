class AddChefToRestaurante < ActiveRecord::Migration
  def change
    add_column :restaurantes, :chef, :string
  end
end
