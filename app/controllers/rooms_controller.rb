class RoomsController < ApplicationController
  before_action :set_room, only: [:destroy, :edit, :update, :show]
  before_action :authenticate_user!
  
  # GET /rooms
  def index
    @rooms = Room.all
  end

  # DELETE /rooms/1
  def destroy
    @room.destroy
    redirect_to rooms_path
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # POST /rooms
  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path, notice: "Pokój został pomyślnie dodany."
    else
      render action: 'new'
    end
  end

  # GET /rooms/1/edit
  def edit
  end


  # PATCH/PUT /rooms/1
  def update
    if @room.update(room_params)
      redirect_to rooms_path, notice: "Pokój został pomyślnie zaktualizowany."
    else
      render action: 'edit'
    end
  end
  
  # GET /rooms/1
  def show
  end

  private
    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:room_number, :floor, :quantity_of_beds, :standard, :price)
    end
end
