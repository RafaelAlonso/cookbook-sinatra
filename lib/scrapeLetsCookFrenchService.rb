require 'open-uri'
require 'nokogiri'

class ScrapeLetsCookFrenchService
  def get_recipes(import_recipe)
    file = "http://www.recipe.com/search/?searchType=recipe&searchTerm=#{import_recipe}"
    doc = Nokogiri::HTML(open(file), nil, 'utf-8')
    recipes = []
    doc.search('.masonryItem').each do |recipe|
      title_recipe = recipe.search('.topSection h3').text
      descript = recipe.search('.topSection .description expanded').text
      time = recipe.search('.recipeInfo .totalTime').text
      recipes << {
        title: title_recipe,
        description: descript,
        time: time
      }
    end
    return recipes
  end
end
