class Receita < ActiveRecord::Base
    validates_presence_of :conteudo, "Não pode ficar em branco"
    validates_presence_of :prato_id
    validates_associated :prato

    # Associations
    belongs_to :prato
end
