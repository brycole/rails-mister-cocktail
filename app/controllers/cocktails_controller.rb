class CocktailsController < ApplicationController
  before_action :find_cocktails, only: %i[show edit destroy update]

  def index
    @cocktails = Cocktail.all
    @cocktails = Cocktail.order(:name)
  end

  def show
    @doses = @cocktail.doses
    # @ingredients = @cocktail.ingredients
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @cocktail.update(cocktail_params)

    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def find_cocktails
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :url, :photo)
  end
end
