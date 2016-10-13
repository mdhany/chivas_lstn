class GiftsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_gift, only: [:show, :edit, :update, :destroy]

  # GET /gifts
  # GET /gifts.json
  def index
    @gifts = Gift.all
  end

  # GET /gifts/1
  # GET /gifts/1.json
  def show
  end

  # GET /gifts/new
  def new
    @gift = Gift.new
  end

  # GET /gifts/1/edit
  def edit
  end

  # POST /gifts
  # POST /gifts.json
  def create
    @gift = Gift.new(gift_params)

    respond_to do |format|
      if @gift.save
        format.html { redirect_to @gift, notice: 'Gift was successfully created.' }
        format.json { render :show, status: :created, location: @gift }
      else
        format.html { render :new }
        format.json { render json: @gift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gifts/1
  # PATCH/PUT /gifts/1.json
  def update
    respond_to do |format|
      if @gift.update(gift_params)
        format.html { redirect_to @gift, notice: 'Gift was successfully updated.' }
        format.json { render :show, status: :ok, location: @gift }
      else
        format.html { render :edit }
        format.json { render json: @gift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gifts/1
  # DELETE /gifts/1.json
  def destroy
    @gift.destroy
    respond_to do |format|
      format.html { redirect_to gifts_url, notice: 'Gift was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def generate_gifts

  end

  def creating_gifts
    g = Event.find params[:event_id]
    if g.gifts.blank?
      #Chivas Flask
      Gift.create!([type_g: 0, name: 'Gorra', position: 10, event_id: params[:event_id], inventory: params[:gifts][:gorra], predicted: params[:gifts][:gorra], priority: 1, image: 'g-gorra.png'])
      Gift.create!([type_g: 0, name: 'Gorra', position: 140, event_id: params[:event_id], inventory: params[:gifts][:gorra1], predicted: params[:gifts][:gorra1], priority: 1, image: 'g-gorra.png'])

      Gift.create!([type_g: 5, name: 'Chivas 12 años 50ml', position: 120, event_id: params[:event_id], inventory: params[:gifts][:ml], predicted: params[:gifts][:ml], priority: 1, image: 'g-ml.jpg'])
      Gift.create!([type_g: 5, name: 'Chivas 12 años 50ml', position: 250, event_id: params[:event_id], inventory: params[:gifts][:ml1], predicted: params[:gifts][:ml1], priority: 1, image: 'g-ml.jpg'])
      Gift.create!([type_g: 5, name: 'Chivas 12 años 50ml', position: 320, event_id: params[:event_id], inventory: params[:gifts][:ml2], predicted: params[:gifts][:ml2], priority: 1, image: 'g-ml.jpg'])

      #type_g: 10 es para los regalos en blanco. Estos deben tener inventario para que funcionen correctamente
        Gift.create!([type_g: 10, name: 'Regalo EN BLANCO', position: 85, event_id: params[:event_id], inventory: 1, predicted:  1, priority: 1])
        Gift.create!([type_g: 10, name: 'Regalo EN BLANCO', position: 300, event_id: params[:event_id], inventory: 1, predicted:  1, priority: 1])
        Gift.create!([type_g: 10, name: 'Regalo EN BLANCO', position: 185, event_id: params[:event_id], inventory: 1, predicted:  1, priority: 1])

      Gift.create!([type_g: 1, name: 'Selfie Stick', position: 160, event_id: params[:event_id], inventory: params[:gifts][:selfie], predicted: params[:gifts][:selfie], priority: 1, image: 'g-selfie.png'])
      Gift.create!([type_g: 1, name: 'Selfie Stick', position: 30, event_id: params[:event_id], inventory: params[:gifts][:selfie1], predicted:  params[:gifts][:selfie1], priority: 1, image: 'g-selfie.png'])

      Gift.create!([type_g: 2, name: 'PowerBank', position: 55, event_id: params[:event_id], inventory: params[:gifts][:power], predicted: params[:gifts][:power], priority: 1, image: 'g-power.png'])
      Gift.create!([type_g: 2, name: 'PowerBank', position: 205, event_id: params[:event_id], inventory: params[:gifts][:power1], predicted: params[:gifts][:power1], priority: 1, image: 'g-power.png'])

      Gift.create!([type_g: 3, name: 'Travel Set', position: 105, event_id: params[:event_id], inventory: params[:gifts][:travel], predicted:  params[:gifts][:travel], priority: 1, image: 'g-travel.png'])
      Gift.create!([type_g: 3, name: 'Travel Set', position: 225, event_id: params[:event_id], inventory: params[:gifts][:travel1], predicted: params[:gifts][:travel1], priority: 1, image: 'g-travel.png'])

      Gift.create!([type_g: 4, name: 'Speaker', position: 275, event_id: params[:event_id], inventory: params[:gifts][:speaker1], predicted: params[:gifts][:speaker1], priority: 1, image: 'g-speaker.png'])
      Gift.create!([type_g: 4, name: 'Speaker', position: 340, event_id: params[:event_id], inventory: params[:gifts][:speaker2], predicted: params[:gifts][:speaker2], priority: 1, image: 'g-speaker.png'])

      redirect_to event_path(params[:event_id]), notice: "Todos los regalos fueron creados"
    else
      redirect_to event_path(params[:event_id]), notice: "Ya este evento contiene Regalos. Por favor editarlos"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gift
      @gift = Gift.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gift_params
      params.require(:gift).permit(:name, :inventory, :predicted, :priority, :event_id)
    end
end
