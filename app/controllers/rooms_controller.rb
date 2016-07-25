class RoomsController < ApplicationController
  before_action :set_room, only: [:destroy, :edit, :update]
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

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path, notice: "Pokój został pomyślnie dodany."
    else
      render action: 'new'
    end
  end

  def edit

  end

  def update
    if @room.update(room_params)
      redirect_to rooms_path, notice: "Pokój został pomyślnie zaktualizowany."
    else
      render action: 'edit'
    end
  end

  private
    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:room_number, :floor, :quantity_of_beds, :standard, :price)
    end
end
