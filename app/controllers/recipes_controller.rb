require 'open-uri'
require 'nokogiri'

class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    # @recipe = Recipe.new(params.require(:recipe).permit(:name))
    ingredient = 'soupe'
    url = "http://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=#{ingredient}"

    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)

    html_doc.search('.recipe-card__title').each do |element|
      @recipe = Recipe.create(name: element.text.strip)
      puts element.text.strip
    end
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
