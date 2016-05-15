class Qualificacao < ActiveRecord::Base
    validates_presence_of :nota, message: "Este campo não pode ficar em branco"
    validates_presence_of :valor_gasto, message: "Não pode ficar em branco"
    validates_numericality_of :nota, greather_than_or_equals_to: 0,
    less_than_or_equals_to: 10, message: "Deve ser um número entre 0 e 10"
    validates_numericality_of :valor_gasto, greather_than: 0,
    message: "Valor gasto deve ser maior do que 0"
    validates_presence_of :cliente_id, :restaurante_id
    validates_associated :cliente, :restaurante

    # Associations
    belongs_to :restaurante
    belongs_to :cliente
end
