class CursosController < ApplicationController
    def index
      @cursos = Curso.all
    end
  
    def show
      @curso = Curso.find(params[:id])
    end
  
    def new
      @curso = Curso.new
    end
  
    def create
      @curso = Curso.new(curso_params)
      if @curso.save
        redirect_to @curso
      else
        render :new
      end
    end
  
    def edit
      @curso = Curso.find(params[:id])
    end
  
    def update
      @curso = Curso.find(params[:id])
      if @curso.update(curso_params)
        redirect_to @curso
      else
        render :edit
      end
    end
  
    def destroy
      @curso = Curso.find(params[:id])
      @curso.destroy
      redirect_to cursos_path
    end
  
    private
  
    def curso_params
      params.require(:curso).permit(:nome_curso)
    end
  end