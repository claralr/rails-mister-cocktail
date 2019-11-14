class DosesController < ApplicationController
  before_action :set_dose, only: [:show ]

  def new

    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)

    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @dose.destroy

    redirect_to doses_path
  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end

end



