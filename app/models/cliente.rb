class Cliente < ActiveRecord::Base
    validate :nascidos_apos_o_ano_2000
    validates_presence_of :nome, :data_nascimento, message: "Deve ser preenchido"
    validates_length_of :nome, maximum: 50, message: "Não pode ter mais de 50 caracteres"

    private
    def nascidos_apos_o_ano_2000
        message_error = "Data de nascimento deve ser maior do que 31/12/1999"
        if data_nascimento
            errors.add(
                "data_nascimento", message_error
            ) unless data_nascimento > Date.new(1999,12,31)
        end
    end
end
