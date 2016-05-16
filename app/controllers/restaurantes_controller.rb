class RestaurantesController < ApplicationController
    def index
        @restaurantes = Restaurante.order :nome
    end

    def show
        @restaurante = Restaurante.find(params[:id])
    end

    def destroy
        @restaurante = Restaurante.find(params[:id])
        @restaurante.destroy
        redirect_to action: "index"
    end

    def new
        @restaurante = Restaurante.new
        @restaurante.nome = "McDonalds"
        @restaurante.especialidade = "Delicias cancerígenas"
    end

    def create
        puts params[:restaurante][:nome]
        puts params[:restaurante][:endereco]
        puts params[:restaurante][:especialidade]

        @restaurante = Restaurante.new restaurante_params
        @restaurante.save
        redirect_to(action: "show", id: @restaurante)
    end

    def restaurante_params
        params.require(:restaurante).permit(:nome, :endereco, :especialidade)
    end

end
