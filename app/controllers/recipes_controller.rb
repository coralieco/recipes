require 'open-uri'
require 'nokogiri'

class RecipesController < ApplicationController
  def index
    #@recipes = Recipe.all
    if Recipe.where(day_bookmark: true).present?
      @recipes = Recipe.where(day_bookmark: true)
    else
      @recipes = Recipe.limit(1).order("RANDOM()")
    end
  end

  def bookmark
    @recipe = Recipe.find(params[:recipe_id])
    @recipe.update(saved: true, save_at: Date.today, day_bookmark: true)
    # @recipe.save!
    redirect_to recipes_path
  end

  def list_bookmarked_recipes
    @recipes = Recipe.where(saved: true)
    #redirect_to list_bookmarked_recipes_recipes_path
  end

  def unbookmark
    @recipe = Recipe.find(params[:recipe_id])
    @recipe.update(saved: false, day_bookmark: false)
    redirect_to list_bookmarked_recipes_recipes_path
  end

  # def destroy
  #   @recipe = Recipe.find(params[:id])
  #   @recipe.destroy
  #   redirect_to recipes_path
  # end
end
