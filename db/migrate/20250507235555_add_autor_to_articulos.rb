class AddAutorToArticulos < ActiveRecord::Migration[8.0]
  def change
    add_column :articulos, :autor, :string
  end
end
