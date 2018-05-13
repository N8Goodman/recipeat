class RecipesController < ApplicationController
  before_action :filter_data, only: [:index]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :form_data, only: [:edit, :new, :create, :update]
  before_action :handle_ingredients, only: [:update]

  # GET /recipes
  # GET /recipes.json
  def index
    @q = Recipe.ransack(params[:q])
    @recipes = @q.result(distinct: true)
    @recipes = filter_recipes(params[:q][:ingredients_name_in].reject(&:empty?)) if params[:q] && params[:q][:ingredients_name_in]
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    respond_to do |format|
      if @recipe.save
        handle_ingredients
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def form_data
      @seasons = Recipe.seasons.keys
      @main_ingredients = Recipe.main_ingredients.keys
      @ingredients = @recipe ? @recipe.ingredients.map {|ingredient| {id: ingredient.id, name: ingredient.name}} : []
    end

    def filter_data
      @seasons = Recipe.seasons
      @main_ingredients = Recipe.main_ingredients
    end

    def handle_ingredients
      if params[:recipe] && params[:recipe][:ingredients]
        ingredients = []
        ingredients_list = params[:recipe][:ingredients].reject!(&:empty?)
        ingredients_list.each do |ingredient_item|
          ingredient = Ingredient.find_or_create_by(name: ingredient_item)
          ingredients << ingredient
          @recipe.ingredients << ingredient unless @recipe.ingredients.include?(ingredient)
        end
        removals = @recipe.ingredients - ingredients
        removals.each do |removed_ingredient|
          @recipe.ingredients.delete(removed_ingredient)
        end
      end
    end

    def filter_recipes(filter_ingredients)
      @recipes.select{ |recipe| (filter_ingredients - recipe.ingredients.map(&:name)).empty?}
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(
        :name, 
        :time, 
        :season, 
        :favorite, 
        :main_ingredient
      )
    end
end
