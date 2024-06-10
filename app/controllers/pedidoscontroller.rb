class PedidosController < ApplicationController
    def index
      @pedidos = Pedido.all
    end
  
    def show
      @pedido = Pedido.find(params[:id])
    end
  
    def new
      @pedido = Pedido.new
    end
  
    def create
      @pedido = Pedido.new(pedido_params)
      if @pedido.save
        redirect_to @pedido
      else
        render :new
      end
    end
  
    def edit
      @pedido = Pedido.find(params[:id])
    end
  
    def update
      @pedido = Pedido.find(params[:id])
      if @pedido.update(pedido_params)
        redirect_to @pedido
      else
        render :edit
      end
    end
  
    def destroy
      @pedido = Pedido.find(params[:id])
      @pedido.destroy
      redirect_to pedidos_path
    end
  
    private
  
    def pedido_params
      params.require(:pedido).permit(:data_pedido, :cliente_id)
    end
  end