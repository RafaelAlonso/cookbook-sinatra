require 'csv'

class Cookbook
  @csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }

  def initialize(csv_file_path)
    @recipes = []
    @file = csv_file_path
    CSV.foreach(@file) do |row|
      recipe = Recipe.new(row[0], row[1], row[2], row[3])
      recipe.done! if row[4] == "true"
      @recipes << recipe
    end
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    # add the recipe to the array
    @recipes << recipe
    # add the recipe to the CSV file
    save_to_csv
  end

  def mark_as_done(recipe_index)
    @recipes[recipe_index].done!
    save_to_csv
  end

  def remove_recipe(recipe_index)
    # remove the recipe from the array
    @recipes.delete_at(recipe_index)
    # save the remotion into the csv
    save_to_csv
  end

  private

  def save_to_csv
    CSV.open(@file, 'wb', @csv_options) do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.cooking_time, recipe.difficulty, recipe.done?]
      end
    end
  end
end
