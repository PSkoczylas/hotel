class ClientsController < ApplicationController
  before_action :set_client, only: [:destroy, :edit, :update, :show]
  before_action :authenticate_user!
  
  # GET /clients
  def index
    @clients = Client.all
  end

  # DELETE /clients/1
  def destroy
    @client.destroy
    redirect_to clients_path
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # POST /clients/
  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to clients_path, notice: "Pokój został pomyślnie dodany."
    else
      render action: 'new'
    end
  end

  # GET /clients/1/edit
  def edit
  end

  # PATCH/PUT /clients/1
  def update
    if @client.update(client_params)
      redirect_to clients_path, notice: "Pokój został pomyślnie zaktualizowany."
    else
      render action: 'edit'
    end
  end

  # GET /rooms/1
  def show
  end

  private
    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:first_name, :last_name, :email, :phone_number)
    end
end
