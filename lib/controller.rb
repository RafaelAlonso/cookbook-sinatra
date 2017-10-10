require_relative 'recipe'
require_relative 'view'
require_relative 'scrapeLetsCookFrenchService'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
    @scraper = ScrapeLetsCookFrenchService.new
  end

  # Option 1 in router
  def list
    display_recipes
  end

  # Option 2 in router
  def create
    name_recipe = @view.ask_for_name
    create_new(name_recipe)

  end

  # Option 3 in router
  def destroy
    display_recipes
    recipe_index = @view.ask_for_index("delete")
    @cookbook.remove_recipe(recipe_index)
  end

  # Option 4 in router
  def import
    search_word = @view.ask_for_import
    recipes = @scraper.get_recipes(search_word)
    chosen_one = @view.pick_import(recipes)
    difficulty = @view.ask_for_difficulty
    recipe = Recipe.new(chosen_one[:title], chosen_one[:description], chosen_one[:time], difficulty)
    @cookbook.add_recipe(recipe)
  end

  # Option 5 in router
  def do_recipe
    display_recipes
    recipe_index = @view.ask_for_index("cook")
    @cookbook.mark_as_done(recipe_index)
  end

  private
  def create_new(name_recipe)
    descr_recipe = @view.ask_for_description
    cook_time = @view.ask_for_preptime
    difficulty = @view.ask_for_difficulty
    recipe = Recipe.new(name_recipe, descr_recipe, cook_time, difficulty)
    @cookbook.add_recipe(recipe)
  end

  def display_recipes
    recipes = @cookbook.all
    @view.display(recipes)
  end
end
