class Restaurante < ActiveRecord::Base
    validates_uniqueness_of :nome
    validates_presence_of :nome, :especialidade
    validates_size_of :especialidade, maximum: 40
    validate :primeira_letra_deve_ser_maiuscula

    # Associations
    has_many :qualificacoes
    has_and_belongs_to_many :pratos

    private
    def primeira_letra_deve_ser_maiuscula
        message_error = "Primeira letra deve ser maiuscula"
        errors.add("nome", message_error) unless nome =~ /[A-Z].*/
    end
end
