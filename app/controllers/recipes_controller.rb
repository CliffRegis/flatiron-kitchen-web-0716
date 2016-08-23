class RecipesController < ApplicationController

def index
@recipes = Recipe.all
end
def show
	@recipe = Recipe.find(params[:id])
end

def new
	@recipe= Recipe.new
	@ingredients = Ingredient.all
#  unless params[:ingredients_attributes][:name].empty?
#   ingredient = Ingredient.find_or_create_by(name: params[:ingredients_attributes][:name])
#   @recipe.ingredients.build(name: ingredient)
# end

end

def create
	@recipe = Recipe.create(recipe_params)
	if @recipe
		redirect_to @recipe
	else 
		render 'new'
	end
end

def edit
	@recipe= Recipe.find(params[:id])
		@ingredients = Ingredient.all 

end

def update
	@recipe= Recipe.find(params[:id])
	@recipe.ingredients =[]
	@recipe.update(recipe_params)
	if @recipe.save
		redirect_to @recipe
	else
		render 'edit'
	end
end

def destroy
	@recipe = Recipe.find(params[:id])
	@recipe.destroy
	redirect_to recipes_path
end

private

 def recipe_params
	params.require(:recipe).permit(:name, ingredient_ids:[])
 end


end