class Articulo < ApplicationRecord
    validates :titulo, presence: true
    validates :contenido, presence: true, length: { minimum: 10}
    validates :autor, presence: true
    has_many :comentarios, dependent: :destroy
end
