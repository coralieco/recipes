require 'open-uri'
require 'nokogiri'

class RecipesController < ApplicationController
  def index
    #@recipes = Recipe.all
    @recipes = Recipe.limit(5).order("RANDOM()")
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    # @recipe = Recipe.new(params.require(:recipe).permit(:name))
    #
    # if @recipe.save!
    #   redirect_to @recipe
    # else
    #   render :new
    # end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end
end
