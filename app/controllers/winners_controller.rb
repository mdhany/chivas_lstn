class WinnersController < ApplicationController
  before_action :authenticate_user!
  before_action :codes_available, only: [:startsort, :new]
  before_action :set_winner, only: [:show, :edit, :update, :destroy]

  def startsort
    #Buscar facturas random que NO HAYAN GANADO
    @ganadores = @codes.first(params[:ganadores])
    #Crear un ganador de cada factura
      #Tomando de forma aleatorea de los regalos disponibles.
    @ganadores.each do |i|
      w = Winner.create(code_id: i.id, customer_id: i.customer_id)
      #Despues de crearlo, buscar aleatoreamente un regalo que tenga inventario y asignarselo.after() do
      if w
        i.update_attribute(:winner?, true)
        #si se crean con exito, cambiar su estado winner a TRUE
      end
    end

    redirect_to winners_path, notice: 'Los ganadores fueron sorteados exitosamente'

  end

  # GET /winners
  # GET /winners.json
  def index
    @winners = Winner.all
  end

  # GET /winners/1
  # GET /winners/1.json
  def show
  end

  # GET /winners/new
  def new
    @winner = Winner.new
  end

  # GET /winners/1/edit
  def edit
  end

  # POST /winners
  # POST /winners.json
  def create
    @winner = Winner.new(winner_params)

    respond_to do |format|
      if @winner.save
        format.html { redirect_to @winner, notice: 'Winner was successfully created.' }
        format.json { render :show, status: :created, location: @winner }
      else
        format.html { render :new }
        format.json { render json: @winner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /winners/1
  # PATCH/PUT /winners/1.json
  def update
    respond_to do |format|
      if @winner.update(winner_params)
        format.html { redirect_to @winner, notice: 'Winner was successfully updated.' }
        format.json { render :show, status: :ok, location: @winner }
      else
        format.html { render :edit }
        format.json { render json: @winner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /winners/1
  # DELETE /winners/1.json
  def destroy
    #Actualizar Codigo a que ya no es utilizado
    if @winner.code.update_attribute(:winner?, false)
      @winner.destroy
    end

    respond_to do |format|
      format.html { redirect_to winners_url, notice: 'El ganador fue eliminado y el codigo liberado' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_winner
      @winner = Winner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def winner_params
      params[:winner]
    end

    def codes_available
      @codes = Code.where(winner?: false, is_used?: true, chivas_code?: true)#.order('RAND()')
    end
end
