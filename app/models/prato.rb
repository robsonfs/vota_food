class Prato < ActiveRecord::Base
    validates :nome, presence: true, uniqueness: true

    # Associations
    has_and_belongs_to_many :restaurantes
    has_one :receita
end
