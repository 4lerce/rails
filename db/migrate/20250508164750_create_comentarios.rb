class CreateComentarios < ActiveRecord::Migration[8.0]
  def change
    create_table :comentarios do |t|
      t.references :articulo, null: false, foreign_key: true
      t.text :comentario

      t.timestamps
    end
  end
end
