class TermsController < ApplicationController
  before_action :set_term, only: [:destroy, :edit, :update]
  before_action :authenticate_user!

  # GET /terms
  def index
    @terms = Term.all
  end
  
  # DELETE /terms/1
  def destroy
    @term.destroy
    redirect_to terms_path
  end
  
  # GET /terms/new
  def new
    @term = Term.new
  end

  # POST /terms
  def create
    @term = Term.new(term_params)
    if @term.save
      redirect_to terms_path, notice: "Pokój został pomyślnie dodany."
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @term.update(term_params)
      redirect_to terms_path, notice: "Termin rezerwacji został pomyślnie zaktualizowany"
    else
      render action: 'edit'
    end
  end

  private

    def set_term
      @term = Term.find(params[:id])
    end

    def term_params
      params.require(:term).permit(:begin_date, :end_date, :quantity_of_beds, :room_id, :client_id)
    end
end
