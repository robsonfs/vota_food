class RestaurantesController < ApplicationController
    def index
        @restaurantes = Restaurante.order :nome
        respond_to do |format|
            format.html { render "index" }
            format.json { render json: @restaurantes }
            format.xml { render xml: @restaurantes}
        end
    end

    def show
        @restaurante = Restaurante.find(params[:id])
    end

    def destroy
        @restaurante = Restaurante.find(params[:id])

        respond_to do |format|
            format.js { head :ok }
            @restaurante.destroy
        end
    end

    def new
        @restaurante = Restaurante.new
    end

    def create
        puts params[:restaurante][:nome]
        puts params[:restaurante][:endereco]
        puts params[:restaurante][:especialidade]

        @restaurante = Restaurante.new restaurante_params
        if @restaurante.save
            redirect_to(action: "show", id: @restaurante)
        else
            render action: "new"
        end
    end

    def edit
        @restaurante = Restaurante.find(params[:id])
    end

    def update
        @restaurante = Restaurante.find(params[:id])
        @restaurante.update_attributes(restaurante_params)
        if @restaurante.save
            redirect_to(action: "show", id: @restaurante)
        else
            render action: "edit"
        end
    end

    def restaurante_params
        params.require(:restaurante).permit(
            :nome, :endereco, :especialidade, :chef
        )
    end

end
