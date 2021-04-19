class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipes = Recipe.all
    @recipe = Recipe.new

  end

  def search
      name = params[:name]
      num = params[:num]

      select_data = Calorie.find_by(name: "#{name}")
      @name = select_data["name"]
  
      @total = select_data["calorie"].to_i * num.to_i / 100

      p @total
  
       
  end

  def create
  

    respond_to do |format|
      if  @symbol==:js
        binding.pry
        name = params[:name]
        num = params[:num]
    
        logger.debug(@calorie)#確認
        @select_data = Calorie.find_by(params[:name])
        logger.debug(@select_data)#確認
    
        @total = select_data["calorie"].to_i * num.to_i / 100

        p @total
    
        format.js { redirect_to }
        
      else
        
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    @recipe.save
    redirect_to recipe_path(@recipe)
      end
        
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  private
  
  def recipe_params
    params.require(:recipe).permit(:title, :body)
    #保存内容が後で増える食材のidを付け加えたい
  end

end
