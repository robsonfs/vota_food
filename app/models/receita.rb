class Receita < ActiveRecord::Base
    validates_presence_of :conteudo, "Não pode ficar em branco"
end
