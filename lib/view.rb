class View
  def display(recipes)
    recipes.each_with_index do |recipe, ind|
      puts "#{ind + 1}. #{recipe.done? ? "[X]" : "[ ]"} #{recipe.name} (#{recipe.cooking_time})"
      puts recipe.description
      puts "(Difficulty: #{recipe.difficulty})"
      puts ""
    end
  end

  def ask_for_name
    puts "What is the name of the recipe you want to add?"
    return gets.chomp
  end

  def ask_for_preptime
    puts "How long does it take to make this recipe?"
    return gets.chomp
  end

  def ask_for_difficulty
    puts "How hard it is to make this recipe?"
    return gets.chomp
  end

  def ask_for_description
    puts "Give it some nice description"
    return gets.chomp
  end

  def ask_for_index(action)
    puts "What is the index of the recipe you want to #{action}?"
    return gets.chomp.to_i - 1
  end

  def ask_for_import
    puts "What is the name of the recipe/ingredient you want to look for?"
    return gets.chomp
  end

  def pick_import(recipes)
    puts "Looking for that in Let's Cook french..."
    puts "#{recipes.size} recipes found for your search!\n"

    recipes.each_with_index { |recipe, i| puts "#{i+ 1 }. #{recipe[:title]}" }

    puts "\nChoose the index of the recipe you want to import"
    ind = gets.chomp.to_i - 1
    puts "Importing #{recipes[ind][:title]}"
    return recipes[ind]
  end
end
