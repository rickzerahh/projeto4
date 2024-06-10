class LivrosController < ApplicationController
    def index
      @livros = Livro.all
    end
  
    def show
      @livro = Livro.find(params[:id])
    end
  
    def new
      @livro = Livro.new
    end
  
    def create
      @livro = Livro.new(livro_params)
      if @livro.save
        redirect_to @livro
      else
        render :new
      end
    end
  
    def edit
      @livro = Livro.find(params[:id])
    end
  
    def update
      @livro = Livro.find(params[:id])
      if @livro.update(livro_params)
        redirect_to @livro
      else
        render :edit
      end
    end
  
    def destroy
      @livro = Livro.find(params[:id])
      @livro.destroy
      redirect_to livros_path
    end
  
    private
  
    def livro_params
      params.require(:livro).permit(:ISBN, :ano_lancamento, :edicao, :titulo_livro, :editora, :qtt_vendas, :qtt_emprestimo, :valor_livro, :tipo_livro, :biblioteca_id, :autor_id)
    end
  end
  