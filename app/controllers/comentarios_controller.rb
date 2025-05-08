class ComentariosController < ApplicationController
  before_action :set_comentario, only: %i[ show edit update destroy ]

  # GET /comentarios or /comentarios.json
  def index
    @comentarios = Comentario.all
  end

  # GET /comentarios/1 or /comentarios/1.json
  def show
  end

  # GET /comentarios/new
  def new
    @comentario = Comentario.new
  end

  # GET /comentarios/1/edit
  def edit
  end

  # POST /comentarios or /comentarios.json
  def create
    @articulo = Articulo.find(params[:articulo_id])
    @comentario = @articulo.comentarios.build(comentario_params)

    respond_to do |format|
      if @comentario.save
        format.html { redirect_to articulo_path(@articulo), notice: "Comentario creado exitosamente." }
        format.json { render :show, status: :created, location: @comentario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comentarios/1 or /comentarios/1.json
  def update
    respond_to do |format|
      if @comentario.update(comentario_params)
        format.html { redirect_to articulo_path(@articulo), notice: "Comentario actualizado exitosamente." }
        format.json { render :show, status: :ok, location: @comentario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comentarios/1 or /comentarios/1.json
  def destroy
    @comentario.destroy!

    respond_to do |format|
      format.html { redirect_to articulo_path_path, status: :see_other, notice: "Comentario eliminado exitosamente." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comentario
      @comentario = Comentario.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def comentario_params
      params.expect(comentario: [ :comentario ])
    end
end
