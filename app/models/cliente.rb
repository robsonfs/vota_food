class Cliente < ActiveRecord::Base
    validates_presence_of :nome, :data_nascimento message: "Deve ser preenchido"
    validates_length_of :nome, :maximum 50,
    message: "Não pode ter mais de 50 caracteres"
    validate :nascidos_apos_o_ano_2000

    private
    def nascidos_apos_o_ano_2000:
        message_error = "Data de nascimento deve ser maior do que 31/12/1999"
        errors.add(
            :data_nascimento, message_error
        ) unless data_nascimento < Date.new(1999,12,31)
    end
end
